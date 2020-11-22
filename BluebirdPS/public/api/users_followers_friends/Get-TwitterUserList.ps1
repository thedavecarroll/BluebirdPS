function Get-TwitterUserList {
    [CmdletBinding()]
    param(
        [ValidateCount(1,100)]
        [string[]]$ScreenName,
        [ValidateCount(1,100)]
        [string[]]$UserId,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/lookup.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters | ConvertTo-Json -Depth 20 | ConvertFrom-Json
}
