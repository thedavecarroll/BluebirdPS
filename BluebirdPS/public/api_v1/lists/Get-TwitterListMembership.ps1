function Get-TwitterListMembership {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$UserName,

        [switch]$OwnedLists
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/memberships.json'
        Query = @{
            'cursor' = -1
            'count' = 1000
        }
    }
    if ($PSBoundParameters.ContainsKey('UserName')) {
        $Request.Query.Add( 'screen_name', $UserName )
        $UserInfo = $UserName
    } else {
        $UserInfo = $BluebirdPSConfiguration.AuthUserName
    }

    if ($OwnedLists.IsPresent) {
        $Request.Query.Add( 'filter_to_owned_lists', 'true' )
    }

    'Getting lists containing user: {0}' -f $UserInfo | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request
}
