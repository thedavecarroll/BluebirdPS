function New-TwitterErrorRecord {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ResponseData]$ResponseData
    )

    function GetErrorData {
        param($ErrorList)
        $AllErrors = [System.Collections.Generic.List[hashtable]]::new()
            foreach ($AnError in $ErrorList) {
                $ThisError = @{}
                foreach ($Property in $AnError.psobject.Properties) {
                    $ThisError.Add($Property.Name,$Property.Value)
                }
                $AllErrors.Add($ThisError)
            }
        $AllErrors
    }

    $ApiResponse  = $ResponseData.ApiResponse

    $ErrorId = 'APIv{0}-{1}' -f $ResponseData.ApiVersion,$ResponseData.Command
    $AllErrors = GetErrorData -ErrorList $ApiResponse.errors

    if ($ApiResponse.psobject.Properties.Name -notcontains 'data') {
        $IsTerminatingError = $true
    } else {
        $IsTerminatingError = $false
    }

    if ($ApiResponse.Type) {
        if ($ApiResponse.errors.message) {
            $ErrorMessage = $ApiResponse.errors.message
        } else {
            $ErrorMessage = $ApiResponse.detail
        }

        $ErrorCategory = Get-ErrorCategory -ErrorType $ApiResponse.Type
        $ExceptionType = Get-ExceptionType -ErrorCategory $ErrorCategory

        if ($ResponseData.Status -eq 403) {
            $ErrorCategory = 'SecurityError'
            $ExceptionType = 'SecurityException'
            $ErrorMessage = "Action forbidden. Please check your permissions. You may need to update your Twitter app's Access Token permissions."
            $IsTerminatingError = $true
        }
        $TwitterException = Get-TwitterException -ExceptionType $ExceptionType -ErrorMessage $ErrorMessage
        $TwitterException.Source = $ResponseData.Command
        $TwitterException.Data.Add('TwitterApiError',$AllErrors)

        $ErrorRecord = [ErrorRecord]::new($TwitterException,$ErrorId,$ErrorCategory,$ResponseData.Endpoint)
        $ErrorRecord.ErrorDetails = $ErrorMessage

        $ErrorParams = @{
            ErrorRecord = $ErrorRecord
            CategoryActivity = $ResponseData.Command
        }

        if ($IsTerminatingError) {
            $ErrorParams.Add('ErrorAction','Stop')
        }
        Write-Error @ErrorParams

    } else {
        $TwitterErrors = $ApiResponse.errors
        for ($i = 0; $i -lt $TwitterErrors.Count; $i++) {
            switch ($ResponseData.ApiVersion) {
                1.1 {
                    $ErrorCategory = Get-ErrorCategory -StatusCode $script:LastStatusCode -ErrorCode $TwitterErrors[$i].Code
                    if ($Twitter.Code -eq 415) {
                        $ErrorMessage = 'Message size exceeds limits of 10000 characters.'
                    } else {
                        $ErrorMessage = $TwitterErrors[$i].Message
                    }
                }
                2 {
                    $ErrorCategory = Get-ErrorCategory -ErrorType $TwitterErrors[$i].Type
                    $ErrorMessage = $TwitterErrors[$i].Detail
                }
            }

            if ($ErrorMessage -match '_metrics') {
                if ($ErrorMessage -match 'field') {
                    $MetricsRegex = "The '\w+\.\w+' field"
                } else {
                    $MetricsRegex = "'\w+\.\w+'"
                }
                $ExceptionType = 'MetricsException'
                if ($ErrorMessage -match 'organic_metrics') {
                    $ErrorMessage = $ErrorMessage -replace $MetricsRegex,'OrganicMetrics'
                } elseif ($ErrorMessage -match 'promoted_metrics') {
                    $ErrorMessage = $ErrorMessage -replace $MetricsRegex,'PromotedMetrics'
                } if ($ErrorMessage -match 'non_public_metrics') {
                    $ErrorMessage = $ErrorMessage -replace $MetricsRegex,'NonPublicMetrics'
                }
            } else {
                $ExceptionType = Get-ExceptionType -ErrorCategory $ErrorCategory
            }

            $TwitterException = Get-TwitterException -ExceptionType $ExceptionType -ErrorMessage $ErrorMessage
            $TwitterException.Source = $ResponseData.Command
            $TwitterException.Data.Add('TwitterApiError',$AllErrors)

            $ErrorRecord = [ErrorRecord]::new($TwitterException,$ErrorId,$ErrorCategory,$ResponseData.Endpoint)
            $ErrorRecord.ErrorDetails = $ErrorMessage

            $ErrorParams = @{
                ErrorRecord = $ErrorRecord
                CategoryActivity = $ResponseData.Command
            }

            if ($ExceptionType -eq 'MetricsException') {
                # only display this exception once despite 3 errors returned for each non_public_metrics field
                $ErrorParams.Add('ErrorAction','Stop')
            } elseif ($IsTerminatingError -and $TwitterErrors.Count -eq ($i + 1)) {
                $ErrorParams.Add('ErrorAction','Stop')
            }
            Write-Error @ErrorParams
        }
    }

}