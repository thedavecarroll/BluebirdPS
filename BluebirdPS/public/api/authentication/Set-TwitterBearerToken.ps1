function Set-TwitterBearerToken {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param()

    try {

        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint = 'https://api.twitter.com/oauth2/token'
            OAuthVersion = 'Basic'
            Body = 'grant_type=client_credentials'
            ContentType = 'application/x-www-form-urlencoded'
        }

        'Attempting to obtain an OAuth 2.0 bearer token.' | Write-Verbose

        $TwitterRequest = Invoke-TwitterRequest -RequestParameters $Request

        $OAuth['BearerToken'] = $TwitterRequest.access_token

        Export-TwitterAuthentication

        'OAuth 2.0 bearer token successfully set.' | Write-Verbose

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
