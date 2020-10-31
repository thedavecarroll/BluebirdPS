function Set-TwitterRateLimitWarning {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='Enable')]
        [switch]$Enable,
        [Parameter(Mandatory,ParameterSetName='Disable')]
        [switch]$Disable
    )

    if ($PSCmdlet.ParameterSetName -eq 'Enable') {
        if ($RateLimitWarning) {
            'RateLimitWarning already set to Enable'
        } else {
            $RateLimitWarning = $true
            'RateLimitWarning set to Enable'
        }
    } else {
        if ($RateLimitWarning) {
            $RateLimitWarning = $false
            'RateLimitWarning set to Disable'
        } else {
            'RateLimitWarning already set to Disable'
        }
    }
}
