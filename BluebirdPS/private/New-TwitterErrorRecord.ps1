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

    $HttpStatusCode = $ResponseData.Status.value__.ToString()
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

        #}
        #foreach ($TwitterError in $ApiResponse.errors) {
            switch ($ResponseData.ApiVersion) {
                1.1 {
                    $ErrorCategory = Get-ErrorCategory -StatusCode $HttpStatusCode -ErrorCode $TwitterErrors[$i].Code
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

            $ExceptionType = Get-ExceptionType -ErrorCategory $ErrorCategory

            $TwitterException = Get-TwitterException -ExceptionType $ExceptionType -ErrorMessage $ErrorMessage
            $TwitterException.Source = $ResponseData.Command
            $TwitterException.Data.Add('TwitterApiError',$AllErrors)

            $ErrorRecord = [ErrorRecord]::new($TwitterException,$ErrorId,$ErrorCategory,$ResponseData.Endpoint)
            $ErrorRecord.ErrorDetails = $ErrorMessage

            $ErrorParams = @{
                ErrorRecord = $ErrorRecord
                CategoryActivity = $ResponseData.Command
            }

            if ($IsTerminatingError -and $TwitterErrors.Count -eq ($i + 1)) {
                $ErrorParams.Add('ErrorAction','Stop')
            }
            Write-Error @ErrorParams
        }
    }

}