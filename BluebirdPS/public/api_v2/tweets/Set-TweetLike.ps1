function Set-TweetLike {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName='LikeById')]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='LikeById')]
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='UnlikeById')]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='LikeByTweet')]
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='UnlikeByTweet')]
        [BluebirdPS.APIV2.TweetInfo.Tweet]$Tweet,

        [Parameter(ParameterSetName='LikeById')]
        [Parameter(ParameterSetName='LikeByTweet')]
        [switch]$Like,

        [Parameter(Mandatory,ParameterSetName='UnlikeById')]
        [Parameter(Mandatory,ParameterSetName='UnlikeByTweet')]
        [switch]$Unlike
    )

    if ($PSCmdlet.ParameterSetName -match 'Id$') {
        $TweetId = $Id
    } else {
        $TweetId = $Tweet.Id
    }
    if ($PSCmdlet.ParameterSetName -match '^Like') {
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint = 'https://api.twitter.com/2/users/{0}/likes' -f $BluebirdPSConfiguration.AuthUserId
            Body =  '{{"tweet_id": "{0}"}}' -f $TweetId
        }
    } else {
        $Request = [TwitterRequest]@{
            HttpMethod = 'DELETE'
            Endpoint = 'https://api.twitter.com/2/users/{0}/likes/{1}' -f $BluebirdPSConfiguration.AuthUserId,$TweetId
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
