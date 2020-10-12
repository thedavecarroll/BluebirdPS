function  Get-TwitterSavedSearch {
    [CmdletBinding()]
    param(
        [long]$Id
    )

    if ($PSBoundParameters.ContainsKey('Id')) {
        $Url = 'https://api.twitter.com/1.1/saved_searches/show/{0}.json' -f $Id
    } else {
        $Url = 'https://api.twitter.com/1.1/saved_searches/list.json'
    }

    $OAuthParameters = [OAuthParameters]::new('GET',$Url)
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
