function Search-Tweet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString,
        [ValidateRange(1,100)]
        [int]$Count=15,
        [switch]$ExcludeEntities
    )

    if (-Not (Test-SearchString -SearchString $SearchString)) {
        'Search string {0} is not valid. Please try again.' -f $SearchString | Write-Error -ErrorAction Stop
    }

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/search/tweets.json',
        $Query
    )

    $SearchTweet = Invoke-TwitterRequest -OAuthParameters $OAuthParameters

    Write-Information -MessageData $SearchTweet.search_metadata
    $SearchTweet.statuses
}
