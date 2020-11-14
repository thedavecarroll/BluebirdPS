function Search-Tweet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString,
        [ValidateRange(1,100)]
        [int]$MaxResults=15,
        [switch]$ExcludeEntities
    )

    Test-SearchString -SearchString $SearchString | Out-Null

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/search/tweets.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
