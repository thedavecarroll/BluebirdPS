function Get-TwitterTimeline {
    [CmdletBinding(DefaultParameterSetName='Mentions')]
    param(
        [Parameter(ParameterSetName='Mentions')]
        [switch]$MentionsTimeline,

        [Parameter(ParameterSetName='Home')]
        [switch]$HomeTimeline,

        [Parameter(ParameterSetName='User')]
        [string]$ScreenName,
        [Parameter(ParameterSetName='User')]
        [string]$UserId,
        [Parameter(ParameterSetName='User')]
        [switch]$ExcludeRetweets,

        [ValidateRange(1,200)]
        [int]$Count = 20
    )

    # since_id
    # max_id
    # trim_user
    # include_entities
    # count - hardcoded to 200

    switch ($PSCmdlet.ParameterSetName) {
        'Mentions' {
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/statuses/mentions_timeline.json',
                @{'count' = $Count}
            )
        }
        'User' {
            if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
                $Query = @{'count' = $Count; 'screen_name' = $ScreenName}
            } else {
                $Query = @{'count' = $Count; 'user_id' = $UserId}
            }

            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/statuses/user_timeline.json',
                $Query
            )
        }
        'Home' {
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/statuses/home_timeline.json',
                @{'count' = $Count}
            )
        }
    }

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters | ConvertTo-Json -Depth 20 | ConvertFrom-Json
}
