function Get-TwitterUserProfileBanner {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [switch]$ExcludeEntities
    )

    if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
        $Query = @{'screen_name'=$ScreenName}
    } else {
        $Query = @{'user_id'=$UserId}
    }

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/profile_banner.json',
        $Query
    )

    @(Invoke-TwitterRequest -OAuthParameters $OAuthParameters).sizes
}
