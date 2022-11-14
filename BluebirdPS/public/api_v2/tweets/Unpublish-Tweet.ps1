function Unpublish-Tweet {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,
        [Parameter(Mandatory,ParameterSetName='ByTweet',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.TweetInfo.Tweet]$Tweet
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $TweetId = $Id
        $TweetInfo = 'Id: {0}' -f $Id
    } else {
        $TweetId = $Tweet.Id
        $TweetInfo = 'Id: {0}, CreatedAt: {1}' -f $Tweet.Id,$Tweet.CreatedAt
    }

    if ($PSCmdlet.ShouldProcess($TweetInfo, 'Deleting Tweet')) {
        $Request = [TwitterRequest]@{
            HttpMethod = 'DELETE'
            Endpoint = 'https://api.twitter.com/2/tweets/{0}' -f $TweetId
        }
        Invoke-TwitterRequest -RequestParameters $Request | Out-Null
    }
}

