function  Get-TwitterSavedSearch {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [Alias('Id')]
        [long]$SearchId
    )

    if ($PSBoundParameters.ContainsKey('Id')) {
        $Url = 'https://api.twitter.com/1.1/saved_searches/show/{0}.json' -f $Id
    } else {
        $Url = 'https://api.twitter.com/1.1/saved_searches/list.json'
    }

    $OAuthParameters = [OAuthParameters]::new('GET',$Url)
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters

}
