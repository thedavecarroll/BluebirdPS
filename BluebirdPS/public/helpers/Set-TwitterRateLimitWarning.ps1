function Set-TwitterRateLimitWarning {
    [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName='Enable')]
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
            $script:RateLimitWarning = $true
            'RateLimitWarning set to Enable'
        }
    } else {
        if ($RateLimitWarning) {
            $script:RateLimitWarning = $false
            'RateLimitWarning set to Disable'
        } else {
            'RateLimitWarning already set to Disable'
        }
    }
}
