function Get-TweetLikes {
    [Alias('Get-TwitterFavorites')]
    [CmdLetBinding(DefaultParameterSetName='ScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [ValidateRange(1,200)]
        [int]$Count=20,
        [long]$SinceId,
        [long]$MaxId,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/favorites/list.json',
        $Query
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters

}
