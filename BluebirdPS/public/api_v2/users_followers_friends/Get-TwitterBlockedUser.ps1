function Get-TwitterBlockedUser {
    [CmdletBinding()]
    param(
        [switch]$IncludeExpansions,

        [ValidateRange(1,1000)]
        [int]$MaxResultsPerPage=1000,
        [switch]$NoPagination
    )

    if ($MaxResultsPerPage -lt 1000) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/users/{0}/blocking' -f $BluebirdPSConfiguration.AuthUserId
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
