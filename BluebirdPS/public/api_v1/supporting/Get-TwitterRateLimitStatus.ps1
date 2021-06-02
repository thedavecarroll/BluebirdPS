
function Get-TwitterRateLimitStatus {
    [CmdletBinding()]
    param(
        [ValidateSet(
            'lists','application','mutes','live_video_stream','friendships','guide','auth','blocks','geo',
            'users','teams','followers','collections','statuses','custom_profiles','webhooks','contacts',
            'labs','i','tweet_prompts','moments','limiter_scalding_report_creation','fleets','help','feedback',
            'business_experience','graphql&POST','friends','sandbox','drafts','direct_messages','media','traffic',
            'account_activity','account','safety','favorites','device','tweets','saved_searches','oauth','search','trends','live_pipeline','graphql'
        )]
        [string[]]$Resources
    )

    if ($Resources.Count -gt 0) {
        $Request = [TwitterRequest]@{
            Endpoint = 'https://api.twitter.com/1.1/application/rate_limit_status.json'
            Query = @{ 'resources' = ($Resources -join ',') }
        }
    } else {
        $Request = [TwitterRequest]@{
            Endpoint = 'https://api.twitter.com/1.1/application/rate_limit_status.json'
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
