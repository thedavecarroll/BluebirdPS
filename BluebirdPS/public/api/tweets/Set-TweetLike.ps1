function Set-TweetLike {
    [CmdletBinding(DefaultParameterSetName='Like')]
    param(
        [Parameter(Mandatory)]
        [Alias('Id)')]
        [long]$TweetId,
        [Parameter(ParameterSetName='Like')]
        [switch]$Like,
        [Parameter(ParameterSetName='Unlike')]
        [switch]$Unlike,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    if ($PSCmdlet.ParameterSetName -eq 'Like') {
        $OAuthParameters = [OAuthParameters]::new(
            'POST',
            'https://api.twitter.com/1.1/favorites/create.json',
            $Query
        )
    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'POST',
            'https://api.twitter.com/1.1/favorites/destroy.json',
            $Query
        )
    }
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
