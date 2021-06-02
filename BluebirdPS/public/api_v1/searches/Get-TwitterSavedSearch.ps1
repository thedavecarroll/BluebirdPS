function  Get-TwitterSavedSearch {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [string]$Id
    )

    if ($PSBoundParameters.ContainsKey('Id')) {
        $Endpoint = 'https://api.twitter.com/1.1/saved_searches/show/{0}.json' -f $Id
    } else {
        $Endpoint = 'https://api.twitter.com/1.1/saved_searches/list.json'
    }

    $Request = [TwitterRequest]@{
        Endpoint = $Endpoint
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
