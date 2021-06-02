function Set-BluebirdPSConfiguration {
    [CmdletBinding()]
    param(
        [BluebirdPS.RateLimitAction]$RateLimitAction,
        [int]$RateLimitThreshold,
        [bool]$RawOutput,
        [switch]$Export
    )

    $ConfigParameters = $PSBoundParameters.Keys.Where{
        $_ -notin [Cmdlet]::CommonParameters -and $_ -ne 'Export'
    }

    foreach ($Config in $ConfigParameters) {
        'Setting configuration value for {0} to {1}' -f $Key,$PSBoundParameters[$Config] | Write-Verbose
        $BluebirdPSConfiguration.$Config = $PSBoundParameters[$Config]
    }

    if ($Export.IsPresent) {
        Export-BluebirdPSConfiguration
    } else {
        'Use the -Export switch to save the new configuration to disk.' | Write-Verbose
    }
}
