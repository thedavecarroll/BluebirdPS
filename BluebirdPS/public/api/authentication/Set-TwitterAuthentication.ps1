function Set-TwitterAuthentication {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param (
        [SecureString]$ApiKey = (Read-Host -Prompt 'API Key' -AsSecureString),
        [SecureString]$ApiSecret = (Read-Host -Prompt 'API Secret' -AsSecureString),
        [SecureString]$AccessToken = (Read-Host -Prompt 'Access Token' -AsSecureString),
        [SecureString]$AccessTokenSecret = (Read-Host -Prompt 'Access Token Secret' -AsSecureString)
    )

    try {
        $OAuth['ApiKey'] = $ApiKey | ConvertFrom-SecureString -AsPlainText
        $OAuth['ApiSecret'] = $ApiSecret | ConvertFrom-SecureString -AsPlainText
        $OAuth['AccessToken'] = $AccessToken | ConvertFrom-SecureString -AsPlainText
        $OAuth['AccessTokenSecret'] = $AccessTokenSecret | ConvertFrom-SecureString -AsPlainText

        if (Test-TwitterAuthentication) {
            'Successfully connected to Twitter.' | Write-Verbose

            Set-TwitterBearerToken
            Set-BluebirdPSAuthUser
            Export-TwitterAuthentication

        } else {
            'Failed authentication verification. Please check your credentials and try again.' | Write-Error -ErrorAction Stop
        }

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
