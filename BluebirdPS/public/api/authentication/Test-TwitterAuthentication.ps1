function Test-TwitterAuthentication {
    [CmdletBinding()]
    param(
        [switch]$BearerToken
    )

    Invoke-TwitterVerifyCredentials @PSBoundParameters | Out-Null
    if ($LastStatusCode -eq '200') {
        $true
        $BluebirdPSConfiguration.AuthValidationDate = Get-Date
    } else {
        $false
        $BluebirdPSConfiguration.AuthValidationDate = $null
    }

    Export-BluebirdPSConfiguration
}
