function Invoke-TwitterRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.TwitterRequest]$RequestParameters
    )

    if ($RequestParameters.Body -and $RequestParameters.ContentType -eq 'application/json') {
        try {
            $RequestParameters.Body | ConvertFrom-Json -Depth 10 | Out-Null
        }
        catch [Newtonsoft.Json.JsonReaderException] {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    switch ($RequestParameters.OAuthVersion) {
        'OAuth1a' {
            $Authentication =  [Authentication]::new(
                $RequestParameters,
                $OAuth['ApiKey'],$OAuth['ApiSecret'],
                $OAuth['AccessToken'],$OAuth['AccessTokenSecret']
            )
        }
        'OAuth2Bearer' {
            $Authentication =  [Authentication]::new(
                $RequestParameters,
                $OAuth['BearerToken']
            )
        }
        'Basic' {
            $Authentication =  [Authentication]::new(
                $RequestParameters,
                $OAuth['ApiKey'],$OAuth['ApiSecret']
            )
        }

    }

    $WebRequestParams = @{
        Uri = $Authentication.Uri
        Method = $Authentication.HttpMethod
        Headers = @{ 'Authorization' = $Authentication.AuthHeader}
        ContentType = $RequestParameters.ContentType
        ResponseHeadersVariable = 'ResponseHeaders'
        StatusCodeVariable = 'StatusCode'
        SkipHttpErrorCheck = $true
        Verbose = $false
    }

    $VerboseProperties = 'Method','Uri','ContentType','OAuthVersion'
    if ($RequestParameters.Form) {
        $WebRequestParams.Add('Form',$RequestParameters.Form)
        $VerboseProperties  += 'Form'
    } elseif ($RequestParameters.Body) {
        $WebRequestParams.Add('Body',$RequestParameters.Body)
        $VerboseProperties  += 'Body'
    }

    if ($RequestParameters.InvocationInfo.BoundParameters.ContainsKey('Verbose')) {
        [PSCustomObject]($WebRequestParams + @{ OAuthVersion = $RequestParameters.OAuthVersion }) |
            Select-Object -Property $VerboseProperties | Format-List |
            Out-String | Write-Verbose
    }

    try {
        $ApiResponse = Invoke-RestMethod @WebRequestParams
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
    $script:LastStatusCode = $StatusCode
    $script:LastHeaders = $ResponseHeaders

    $ResponseData = [ResponseData]::new($RequestParameters,$Authentication,$ResponseHeaders,$LastStatusCode,$ApiResponse,$BluebirdPSConfiguration.AuthUserName)

    $ShouldResume = $false
    if ($ResponseData.RateLimitRemaining -eq 0) {
        $WaitUntil = New-TimeSpan -End $ResponseData.RateLimitReset
        $RateLimitReached = 'Rate limit of {0} has been reached.' -f $ResponseData.RateLimit,$ResponseData.RateLimitReset
        $RateLimitStop = 'Please wait until {0} before making another attempt for this resource.' -f $ResponseData.RateLimitReset
        $RateLimitWait = 'Waiting until {0} before resuming attempts for this resource.' -f $ResponseData.RateLimitReset

        if ($BluebirdPSConfiguration.RateLimitAction -eq [RateLimitAction]::Resume) {
            $RateLimitReached,$RateLimitWait | Write-Warning
            $ResumeTimeout = $ResponseData.RateLimitReset.AddHours(1)
            $SleepSeconds = 60
            $WriteProgress = @{
                Activity = 'Waiting for RateLimitReset time'
                Status = 'Waiting {0} seconds...' -f $SleepSeconds
            }
            while ($ResponseData.RateLimitReset -gt [datetime]::Now -and [datetime]::Now -lt $ResumeTimeout) {
                $SecondsLeft = $ResponseData.RateLimitReset.Subtract([datetime]::Now).TotalSeconds
                if ($SecondsLeft -le $SleepSeconds) {
                    $SleepSeconds = $SecondsLeft
                }
                $Percent = ($WaitUntil.TotalSeconds - $SecondsLeft) / $WaitUntil.TotalSeconds * 100
                if ([System.Environment]::UserInteractive) {
                    Write-Progress @WriteProgress -SecondsRemaining $SecondsLeft -PercentComplete $Percent
                } else {
                    'Waiting {0} seconds with {1} seconds remaining.' -f $SleepSeconds,$SecondsLeft | Write-Verbose -Verbose
                }
                Start-Sleep -Seconds $SleepSeconds
            }
            Write-Progress @WriteProgress -SecondsRemaining 0 -Completed
            $ShouldResume = $true
        } else {
            $RateLimitReached,$RateLimitStop | Write-Error -ErrorAction Stop
        }
    }

    if (($ResponseData.RateLimitRemaining -le $BluebirdPSConfiguration.RateLimitThreshold -and $null -ne $ResponseData.RateLimitRemaining)) {
        $RateLimitMessage = 'The rate limit for this resource is {0}. There are {1} remaining calls to this resource until {2}. ' -f $ResponseData.RateLimit, $ResponseData.RateLimitRemaining, $ResponseData.RateLimitReset
        switch ($BluebirdPSConfiguration.RateLimitAction) {
            [RateLimitAction]::Verbose { $RateLimitMessage | Write-Verbose -Verbose; break}
            [RateLimitAction]::Warning { $RateLimitMessage | Write-Warning -Warning; break}
            [RateLimitAction]::Error { $RateLimitMessage | Write-Error ; break}
            [RateLimitAction]::Resume {
                @($RateLimitMessage,
                    'The RateLimitAction is set to Resume. When the rate limit has been reached, the command will wait until the time above before continuing.'
                ) | Write-Verbose -Verbose
                break
            }
        }
    }

    Write-TwitterResponse -ResponseData $ResponseData

    if ($RequestParameters.NoPagination) {
        return

    } elseif ($ShouldResume) {
        $RequestParameters.Paginate($BluebirdPSLastResponse.ApiResponse.meta.next_token)
        Invoke-TwitterRequest -RequestParameters $RequestParameters

    } else {
        if ($ResponseData.ApiResponse.psobject.Properties.Name -match 'meta|next_cursor') {

            $Progress = @{
                Activity = 'Retrieving paged results from Twitter API'
            }

            if ($RequestParameters.Endpoint -match '\/2\/' -and $null -ne $ResponseData.ApiResponse.meta.next_token) {
                # Twitter API V2 pagination
                if ($ResponseData.ApiResponse.meta.result_count) {
                    'Returned {0} objects' -f $ResponseData.ApiResponse.meta.result_count | Write-Verbose
                }
                $RequestParameters.Paginate($ResponseData.ApiResponse.meta.next_token)
            } elseif ($null -ne $ResponseData.ApiResponse.next_cursor -and $ResponseData.ApiResponse.next_cursor -ne 0) {
                # Twitter API V1.1 cursoring, calls to endpoints will assume starting cursor of -1
                $RequestParameters.Paginate($ResponseData.ApiResponse.next_cursor)

            } else {
                return
            }

            Write-Progress @Progress
            Start-Sleep -Milliseconds (Get-Random -Minimum 300 -Maximum 600)
            Invoke-TwitterRequest -RequestParameters $RequestParameters
        }
    }
}