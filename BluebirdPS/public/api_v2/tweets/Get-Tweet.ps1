function Get-Tweet {
    [OutputType(
        'BluebirdPS.APIV2.TweetInfo.Tweet',
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.MediaInfo.Media',
        'BluebirdPS.APIV2.Objects.Poll'
    )]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,Position=0)]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string[]]$Id,

        [switch]$IncludeExpansions,

        [ValidateRange(10,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination,

        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics
    )

    $Request = [TwitterRequest]@{
        ExpansionType = 'Tweet'
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
        IncludeExpansions = $IncludeExpansions
    }

    if ($Id.Count -gt 1) {
        $Request.Query.Add('ids',($Id -join ','))
        $Request.Endpoint = 'https://api.twitter.com/2/tweets'
    } else {
        $Request.Endpoint = 'https://api.twitter.com/2/tweets/{0}' -f $Id
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
