function Get-TwitterSavedSearches {
    [CmdletBinding()]
    param(
        [long]$Id
    )

    if ($PSBoundParameters.ContainsKey('Id')) {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            "https://api.twitter.com/1.1/saved_searches/show/$Id.json"
        )
    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/saved_searches/list.json'
        )
    }

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}