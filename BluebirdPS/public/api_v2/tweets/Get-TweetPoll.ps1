function Get-TweetPoll {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ByTweet')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.TweetInfo.Tweet]$Tweet
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $TweetId = $Id
        }
        'ByTweet'   {
            $TweetId = $Tweet.Id
        }
    }

    Get-Tweet -Id $TweetId -IncludeExpansions | Where-Object { $_.psobject.TypeNames -contains 'BluebirdPS.APIV2.Objects.Poll' }
}
