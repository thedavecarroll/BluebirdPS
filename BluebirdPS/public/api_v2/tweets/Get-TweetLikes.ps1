function Get-TweetLikes {
    [OutputType(
        'BluebirdPS.APIV2.UserInfo.User'
    )]
    [CmdLetBinding(DefaultParameterSetName='ById')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ByTweet')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.TweetInfo.Tweet]$Tweet,

        [switch]$IncludeExpansions
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $TweetId = $Id
        }
        'ByTweet' {
            $TweetId = $Tweet.Id
        }
    }

    $Request = [TwitterRequest]@{
        ExpansionType = 'User'
        Endpoint = 'https://api.twitter.com/2/tweets/{0}/liking_users' -f $TweetId
        IncludeExpansions = $IncludeExpansions
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
