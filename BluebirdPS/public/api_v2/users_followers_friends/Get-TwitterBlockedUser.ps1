function Get-TwitterBlockedUser {
    [CmdletBinding()]
    param(
        [switch]$IncludeExpansions
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/users/{0}/blocking' -f $BluebirdPSConfiguration.AuthUserId
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        Query = @{ 'max_results' = 1000 }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
