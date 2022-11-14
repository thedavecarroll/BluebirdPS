function Search-Tweet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString,

        [switch]$IncludeExpansions,

        [ValidateRange(10,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination,

        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics
    )

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/tweets/search/recent'
        Query =  @{
            'query' = $SearchString
            'max_results' = $MaxResultsPerPage
        }
        ExpansionType = 'Tweet'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
