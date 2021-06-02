function Invoke-TwitterVerifyCredentials {
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
            Endpoint = 'https://api.twitter.com/1.1/account/verify_credentials.json'
            Query = @{ include_entities = 'false'; skip_status = 'true' }
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
