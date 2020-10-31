function Write-TwitterResponseData {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipelineByPropertyName)]
        [object]$TwitterResponse,
        [Parameter(ValueFromPipelineByPropertyName)]
        [int32]$StatusCode,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$Uri,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$HttpMethod,
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$QueryString
    )

    try {

        $Command = (Get-PSCallStack).Where{$_.Command -notmatch 'TwitterResource|ErrorRecord|ResponseData|Request|ScriptBlock'}.Command

        if ($TwitterResponse.Status) {
            $Status = $TwitterResponse.Status[0]
        }
        if ($TwitterResponse.Server) {
            $Server = $TwitterResponse.Server[0]
        }
        if ($TwitterResponse['x-response-time']) {
            $ResponseTime = $TwitterResponse['x-response-time'][0]
        }

        $ResponseData = [PsCustomObject]@{
            PSTypeName = 'Twitter.Response'
            Command = $Command
            HttpMethod = $HttpMethod
            Uri = $Uri
            QueryString = $QueryString
            Status = $Status
            Server = $Server
            ResponseTime = $ResponseTime
            RateLimit = $null
            RateLimitRemaining = $null
            RateLimitReset = $null
            Response = $TwitterResponse
        }
        if ($TwitterResponse['x-rate-limit-limit']) {
            [int]$ResponseData.RateLimit = $TwitterResponse['x-rate-limit-limit'][0]
        }
        if ($TwitterResponse['x-rate-limit-remaining']) {
            [int]$ResponseData.RateLimitRemaining = $TwitterResponse['x-rate-limit-remaining'][0]
        }
        if ($TwitterResponse['x-rate-limit-reset']) {
            [long]$Ticks = $TwitterResponse['x-rate-limit-reset'][0]
            $ResponseData.RateLimitReset = (Get-Date -Date '1/1/1970').AddSeconds($Ticks).ToLocalTime()
        }

        if ($ResponseData.RateLimitRemaining -eq 0 -and $null -ne $ResponseData.RateLimitRemaining) {
            $RateLimitReached = 'Rate limit of {0} has been reached. Please wait until {1} before making another attempt for this resource.' -f $ResponseData.RateLimit,$ResponseData.RateLimitReset
            $RateLimitReached | Write-Error -ErrorAction Stop
        }

        if (($ResponseData.RateLimitRemaining -le 5 -and $null -ne $ResponseData.RateLimitRemaining) -or $RateLimitWarning) {
            $RateWarningMessage = 'The rate limit for this resource is {0}. There are {1} remaining calls to this resource until {2}. ' -f $ResponseData.RateLimit, $ResponseData.RateLimitRemaining, $ResponseData.RateLimitReset
            $RateWarningMessage | Write-Warning
        }

        $TwitterHistoryList.Add($ResponseData)
        Write-Information -MessageData $ResponseData
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
