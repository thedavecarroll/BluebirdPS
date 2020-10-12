function Get-TwitterLanguages {
    [CmdletBinding()]
    param()

    $OAuthParameters = [OAuthParameters]::new('GET','https://api.twitter.com/1.1/help/languages.json')
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
