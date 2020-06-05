function Search-Tweet {
    [CmdletBinding()]
    param(
        [string]$SearchString,
        [ValidateRange(1,100)]
        [int]$MaxResults=20,
        [switch]$ExcludeEntities
    )

    $Query = [hashtable]::new()
    if ($PSBoundParameters.ContainsKey('ExcludeEntities')) {
        $Query.Add('include_entities','false')
    } else {
        $Query.Add('include_entities','true')
    }
    $Query.Add('count', $MaxResults)
    $Query.Add('q',[System.Uri]::EscapeDataString($SearchString))

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/search/tweets.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}