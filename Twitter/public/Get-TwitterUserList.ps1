function Get-TwitterUserList {
    [CmdletBinding()]
    param(
        [string[]]$ScreenName,
        [string[]]$UserId,
        [ValidateSet('Compatibility','Extended')]
        [string]$TweetMode='Extended',
        [switch]$ExcludeEntities
    )

    #Returns 100 max - does it automatically truncate? internal this should happen before sending to API
    if ($ScreenName.Count -gt 100 -or $UserId.Count -gt 100) {
        'This command can only return a maximum of 100 Twitter user objects' | Write-Warning
        'All user criteria above 100 will be truncated.' | Write-Warning
    }

    $Query = [hashtable]::new()
    if ($PSBoundParameters.ContainsKey('ExcludeEntities')) {
        $Query.Add('include_entities','false')
    } else {
        $Query.Add('include_entities','true')
    }
    if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
        $Query.Add('screen_name',($ScreenName -join ','))
    } else {
        $Query.Add('user_id',($UserId -join ','))
    }

    $TweetMode -eq 'Compatibility' ? $Query.Add('tweet_mode','compat') : $Query.Add('tweet_mode','extended')

    $OAuthParameters = [OAuthParameters]::new(
        'Get',
        'https://api.twitter.com/1.1/users/lookup.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
