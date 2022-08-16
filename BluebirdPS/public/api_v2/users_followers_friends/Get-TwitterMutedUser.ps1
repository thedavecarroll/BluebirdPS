function Get-TwitterMutedUser {
    [OutputType('BluebirdPS.APIV2.UserInfo.User')]
    [OutputType('BluebirdPS.APIV2.TweetInfo.Tweet')]
    [CmdletBinding()]
    param(
        [switch]$IncludeExpansions,

        [ValidateRange(1,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/users/{0}/muting' -f $BluebirdPSConfiguration.AuthUserId
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
