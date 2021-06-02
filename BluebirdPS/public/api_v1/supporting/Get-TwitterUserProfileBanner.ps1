function Get-TwitterUserProfileBanner {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$UserName
    )

    if (-Not $PSBoundParameters.ContainsKey('UserName')) {
        $Query = @{ 'screen_name' = $BluebirdPSConfiguration.AuthUserName }
    } else {
        $Query = @{ 'screen_name' = $UserName }
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/users/profile_banner.json'
        Query = $Query
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
