function Invoke-TwitterRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [TwitterRequest]$RequestParameters
    )

    try {

        if ($RequestParameters.Body -and $RequestParameters.ContentType -eq 'application/json') {
            try {
                $RequestParameters.Body | ConvertFrom-Json -Depth 10 | Out-Null
            }
            catch {
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
        if ($RequestParameters.Form) {
            $WebRequestParams.Add('Form',$RequestParameters.Form)
        } elseif ($RequestParameters.Body) {
            $WebRequestParams.Add('Body',$RequestParameters.Body)
        }

        $ApiResponse = Invoke-RestMethod @WebRequestParams
        $script:LastStatusCode = $StatusCode
        $script:LastHeaders = $ResponseHeaders

        $ResponseData = [ResponseData]::new($RequestParameters,$Authentication,$ResponseHeaders,$LastStatusCode,$ApiResponse)

        Write-TwitterResponse -ResponseData $ResponseData

        # recursively call this function for pagination or cursoring
        $script:CurrentPage = 2
        $Progress = @{
            Activity = 'Retrieving paged results from Twitter API'
            Status = 'Current page'
        }

        if ($ResponseData.ApiResponse.psobject.Properties.Name -match 'meta|next_cursor') {

            Write-Progress @Progress -CurrentOperation $CurrentPage
            $CurrentPage++

            Start-Sleep -Milliseconds (Get-Random -Minimum 300 -Maximum 600)

            if ($ResponseData.ApiResponse.meta.next_token.length -gt 0) {

                # Twitter API V2
                'Returned {0} objects' -f $ResponseData.ApiResponse.meta.result_count | Write-Verbose

                if ($RequestParameters.Query.Keys -match 'pagination_token') {
                    $RequestParameters.Query.Remove('pagination_token')
                }

                # The endpoint /2/tweets/search/recent uses a different token for pagination
                # https://twittercommunity.com/t/why-does-timeline-use-pagination-token-while-search-uses-next-token/150963/2
                if ($RequestParameters.Endpoint -match 'tweets\/search\/recent') {
                    if ($RequestParameters.Query.Keys -match 'next_token') {
                        $RequestParameters.Query.Remove('next_token')
                    }
                    $NextPageKey = 'next_token'
                } else {
                    if ($RequestParameters.Query.Keys -match 'pagination_token') {
                        $RequestParameters.Query.Remove('pagination_token')
                    }
                    $NextPageKey = 'pagination_token'
                }
                $RequestParameters.Query.Add($NextPageKey,$ResponseData.ApiResponse.meta.next_token)

            } elseif ($ResponseData.ApiResponse.next_cursor) {

                # Twitter API V1.1, calls to endpoints will assume starting cursor of -1
                if ($RequestParameters.Query.Keys -match 'cursor') {
                    $RequestParameters.Query.Remove('cursor')
                }
                $RequestParameters.Query.Add('cursor',$ResponseData.ApiResponse.next_cursor)

                Invoke-TwitterRequest -RequestParameters $RequestParameters
            }
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}