function Get-TwitterListTweets {
    [OutputType(
        'BluebirdPS.APIV2.TweetInfo.Tweet',
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.MediaInfo.Media',
        'BluebirdPS.APIV2.Objects.Poll'
    )]
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [switch]$IncludeExpansions,

        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics,

        [ValidateRange(10,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/lists/{0}/tweets' -f $List.Id
        Query = @{ 'max_results' = $MaxResultsPerPage }
        ExpansionType = 'Tweet'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
    }

    Invoke-TwitterRequest -RequestParameters $Request
}