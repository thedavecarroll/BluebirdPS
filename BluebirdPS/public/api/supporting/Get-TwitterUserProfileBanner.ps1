function Get-TwitterUserProfileBanner {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/profile_banner.json',
        $Query
    )

    @(Invoke-TwitterRequest -OAuthParameters $OAuthParameters).sizes
}
