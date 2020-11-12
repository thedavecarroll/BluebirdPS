function Get-TwitterUserList {
    [CmdletBinding()]
    param(
        [ValidateCount(100)]
        [string[]]$ScreenName,
        [ValidateCount(100)]
        [string[]]$UserId,
        [ValidateSet('Compatibility','Extended')]
        [string]$TweetMode='Extended',
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/lookup.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
