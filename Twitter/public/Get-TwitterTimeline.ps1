function Get-TwitterTimeline {
    [CmdletBinding()]
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
        [string]$IncludeRetweets
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
                @{'count' = 200}
            )
        }
        'User' {
            if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
                $Query = @{'count' = 200; 'screen_name' = $ScreenName}
            } else {
                $Query = @{'count' = 200; 'user_id' = $UserId}
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
                @{'count' = 200}
            )
        }
    }

    @(Invoke-TwitterRequest -OAuthParameters $OAuthParameters)
}