function Set-TwitterAuthentication {
    [CmdletBinding()]
    param (
        [SecureString]$ApiKey = (Read-Host -Prompt 'API Key' -AsSecureString),
        [SecureString]$ApiSecret = (Read-Host -Prompt 'API Secret' -AsSecureString),
        [SecureString]$AccessToken = (Read-Host -Prompt 'Access Token' -AsSecureString),
        [SecureString]$AccessTokenSecret = (Read-Host -Prompt 'Access Token Secret' -AsSecureString),
        [switch]$Persist
    )

    try {
        $OAuth['ApiKey'] = $ApiKey | ConvertFrom-SecureString -AsPlainText
        $OAuth['ApiSecret'] = $ApiSecret | ConvertFrom-SecureString -AsPlainText
        $OAuth['AccessToken'] = $AccessToken | ConvertFrom-SecureString -AsPlainText
        $OAuth['AccessTokenSecret'] = $AccessTokenSecret | ConvertFrom-SecureString -AsPlainText
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    if ($PSBoundParameters.ContainsKey('Persist')) {
        Export-TwitterAuthentication
    }

}
