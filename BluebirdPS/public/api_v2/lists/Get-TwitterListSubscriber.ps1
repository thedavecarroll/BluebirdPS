function Get-TwitterListSubscriber {
    [OutputType(
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.TweetInfo.Tweet'
    )]
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [switch]$IncludeExpansions,

        [ValidateRange(1,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/lists/{0}/followers' -f $List.Id
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
