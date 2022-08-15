function Get-TwitterListMembership {
    [OutputType(
        'BluebirdPS.APIV2.ListInfo.List',
        'BluebirdPS.APIV2.UserInfo.User'
    )]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [switch]$IncludeExpansions,

        [ValidateRange(1,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    if ($null -eq $User.Id) {
        $UserId = $BluebirdPSConfiguration.AuthUserId
    } else {
        $UserId = $User.Id
    }
    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint ='https://api.twitter.com/2/users/{0}/list_memberships' -f $UserId
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'List'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
