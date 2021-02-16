
function Get-TwitterRateLimitStatus {
    [CmdletBinding()]
    param(
        [ValidateSet(
            'account','account_activity','admin_users','application','auth','blocks','business_experience','collections',
            'contacts','custom_profiles','device','direct_messages','drafts','favorites','feedback','fleets','followers',
            'friends','friendships','geo','graphql','graphql&POST','guide','help','i','labs','limiter_scalding_report_creation',
            'lists','live_pipeline','live_video_stream','media','moments','mutes','oauth','safety','sandbox','saved_searches',
            'search','statuses','strato','teams','traffic','trends','tweets','tweet_prompts','users','webhooks'
        )]
        [string[]]$Resources
    )

    if ($Resources.Count -gt 0) {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/application/rate_limit_status.json',
            @{ 'resources' = ($Resources -join ',') }
        )
    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/application/rate_limit_status.json'
        )
    }

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters | Select-Object -ExpandProperty resources
}
