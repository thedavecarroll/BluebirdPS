function Search-Tweet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString,

        [ValidateRange(10,100)]
        [int]$MaxResults=100,

        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics,
        [switch]$IncludeExpansions
    )

    $Request = [TwitterRequest]@{
        ExpansionType = 'Tweet'
        Endpoint = 'https://api.twitter.com/2/tweets/search/recent'
        Query =  @{
            'query' = $SearchString
            'max_results' = $MaxResults
        }
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
        IncludeExpansions = $IncludeExpansions
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
