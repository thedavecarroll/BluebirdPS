function Get-Tweet {
    [OutputType(
        'BluebirdPS.APIV2.TweetInfo.Tweet',
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.MediaInfo.Media',
        'BluebirdPS.APIV2.Objects.Poll'
    )]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,Position=0,ParameterSetName='Tweet')]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,100)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string[]]$Id,
        [Parameter(Mandatory,Position=0,ParameterSetName='Conversation')]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The conversation tweet Id '{0}' is not valid.")]
        [string]$ConversationId,
        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics,
        [switch]$IncludeExpansions
    )

    $Request = [TwitterRequest]@{
        ExpansionType = 'Tweet'
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
        IncludeExpansions = $IncludeExpansions
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Tweet' {
            if ($Id.Count -gt 1) {
                $Request.Query.Add('ids', ($Id -join ','))
                $Request.Endpoint = 'https://api.twitter.com/2/tweets'
            } else {
                $Request.Endpoint = 'https://api.twitter.com/2/tweets/{0}' -f $Id
            }
        }
        'Conversation' {
            $OriginalTweet = Get-Tweet -Id $ConversationId
            $OriginalTweet
            if ($OriginalTweet.CreatedAt -lt (Get-Date).AddDays(-7)) {
                'As searching by ConversationId is based on recent search from the Standard product track, you can only retreive a conversation that started within the last 7 days.' | Write-Warning
                return
            }
            $Request.Query.Add('query',('conversation_id:{0}' -f $ConversationId))
            $Request.Endpoint = 'https://api.twitter.com/2/tweets/search/recent'
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
