function Get-TweetConversation {
    [OutputType(
        'BluebirdPS.APIV2.TweetInfo.Tweet',
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.MediaInfo.Media',
        'BluebirdPS.APIV2.Objects.Poll'
    )]
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ById')]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The tweet Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='ByTweet')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.TweetInfo.Tweet]$Tweet,

        [switch]$IncludeExpansions,

        [ValidateRange(10,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination,

        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics
    )

    # The initial Get-Tweet needs to include the switch parameters that are present
    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $Tweet = Get-Tweet -Id $Id
    }

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    if ($Tweet.CreatedAt -lt (Get-Date).AddDays(-7)) {
        'As searching by ConversationId is based on recent search from the Standard product track, you can only retreive a conversation that started within the last 7 days.' | Write-Warning
        return
    }
    $Tweet

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/2/tweets/search/recent'
        Query = @{ 'query' = ('conversation_id:{0}' -f $Id) }
        ExpansionType = 'Tweet'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
