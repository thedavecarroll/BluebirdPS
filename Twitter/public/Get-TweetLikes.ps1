function Get-TweetLikes {
    [Alias('Get-TwitterFavorites')]
    [CmdLetBinding(DefaultParameterSetName='ScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [ValidateRange(1,200)]
        [int]$Count=20
    )

    # add since_id and max_id

    $Query = [hashtable]::new()
    if ($PSBoundParameters.ContainsKey('ExcludeEntities')) {
        $Query.Add('include_entities','false')
    } else {
        $Query.Add('include_entities','true')
    }
    if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
        $Query.Add('screen_name',$ScreenName)
    } else {
        $Query.Add('user_id',$UserId)
    }
    $Query.Add('count',$Count)

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/favorites/list.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
