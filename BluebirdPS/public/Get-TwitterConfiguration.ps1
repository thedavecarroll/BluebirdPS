function Get-TwitterConfiguration {
    [CmdletBinding()]
    param()

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/help/configuration.json'
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
