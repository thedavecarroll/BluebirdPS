function Get-TweetCount {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString,

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Minute','Hour','Day')]
        [string]$Granularity = 'Hour',

        [ValidateNotNullOrEmpty()]
        [datetime]$StartTime,
        [ValidateNotNullOrEmpty()]
        [datetime]$EndTime,

        [ValidateNotNullOrEmpty()]
        [string]$SinceId,
        [ValidateNotNullOrEmpty()]
        [string]$UntilId,

        [Parameter(Mandatory,ParameterSetName='Summary')]
        [switch]$Summary,

        [Parameter(Mandatory,ParameterSetName='CountOnly')]
        [switch]$CountOnly
    )

    $Request = [TwitterRequest]@{
        OAuthVersion = 'OAuth2Bearer'
        Endpoint = 'https://api.twitter.com/2/tweets/counts/recent'
        Query = @{
            query = $SearchString
            granularity = $Granularity.ToLower()
        }
    }

    if ($PSBoundParameters.ContainsKey('StartTime')) {
        $Request.Query.Add('start_time',[Helpers]::ConvertToV1Date($StartTime))
    }
    if ($PSBoundParameters.ContainsKey('EndTime')) {
        $Request.Query.Add('end_time',[Helpers]::ConvertToV1Date($EndTime))
    }
    if ($PSBoundParameters.ContainsKey('SinceId')) {
        $Request.Query.Add('since_id',$SinceId)
    }
    if ($PSBoundParameters.ContainsKey('UntilId')) {
        $Request.Query.Add('until_id',$UntilId)
    }

    $TweetCount = Invoke-TwitterRequest -RequestParameters $Request
    $TotalCount = (Get-BluebirdPSHistory -Last 1).ApiResponse.meta.total_tweet_count
    $TweetCountSummary = [TweetInfo.TweetCountSummary]@{
        SearchString = $SearchString
        Granularity = $Granularity
        StartTime = ($TweetCount.Start | Select-Object -First 1)
        EndTime = ($TweetCount.End | Select-Object -Last 1)
        TotalCount = $TotalCount
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Summary' {
            $TweetCountSummary
        }
        'CountOnly' {
            $TotalCount
        }
        default {
            $TweetCount
        }
    }
}
