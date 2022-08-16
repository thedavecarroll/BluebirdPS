function Invoke-TwitterVerifyCredentials {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [CmdletBinding()]
    param(
        [switch]$BearerToken
    )

    if ($BearerToken.IsPresent) {
        $Request = [TwitterRequest]@{
            OAuthVersion = 'OAuth2Bearer'
            Endpoint = 'https://api.twitter.com/2/users/{0}' -f $BluebirdPSConfiguration.AuthUserId
        }
    } else {
        $Request = [TwitterRequest]@{
            ExpansionType     = 'User'
            IncludeExpansions = $IncludeExpansions
            Endpoint = 'https://api.twitter.com/2/users/me'
        }
    }

    $Request.SetCommandName((Get-PSCallStack).Command[1])

    try {
        Invoke-TwitterRequest -RequestParameters $Request
        $BluebirdPSConfiguration.AuthValidationDate = Get-Date
    }
    catch {
        $BluebirdPSConfiguration.AuthValidationDate = $null
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
