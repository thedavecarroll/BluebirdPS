function Invoke-TwitterVerifyCredentials {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [CmdletBinding()]
    param(
        [switch]$BearerToken
    )

    if ($BearerToken.IsPresent) {
        if ($script:IsFreeTier) {
            'It appears that you have only Free Tier access to the Twitter API.','You will not be able to use any endpoint that requires OAuth2 BearerToken authentication.' | Write-Verbose
            return
        } else {
            $Request = [TwitterRequest]@{
                OAuthVersion = 'OAuth2Bearer'
                Endpoint = 'https://api.twitter.com/2/users/{0}' -f $BluebirdPSConfiguration.AuthUserId
            }
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

    if ($script:BluebirdPSHistoryList.Count -eq 1) {
        $script:IsFreeTier = $script:LastHeaders['x-rate-limit-limit'] -eq 25 ? $true : $false
    }
}
