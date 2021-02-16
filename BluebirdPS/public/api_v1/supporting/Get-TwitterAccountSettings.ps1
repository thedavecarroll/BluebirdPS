function Get-TwitterAccountSettings {
    [CmdletBinding()]
    param()

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/account/settings.json'
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
