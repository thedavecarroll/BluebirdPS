function Get-TwitterListSubscription {
    [OutputType('BluebirdPS.APIV2.ListInfo.List')]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [switch]$IncludeExpansions,

        [ValidateRange(1,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    $UserId = $User.Id ? $User.Id : $BluebirdPSConfiguration.AuthUserId
    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint ='https://api.twitter.com/2/users/{0}/followed_lists' -f $UserId
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'List'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
