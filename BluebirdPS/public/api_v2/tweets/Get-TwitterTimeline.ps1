function Get-TwitterTimeline {
    [CmdletBinding(DefaultParameterSetName='User')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(ParameterSetName='User')]
        [ValidateSet('Retweets','Replies')]
        [string[]]$Exclude,

        [Parameter(Mandatory,ParameterSetName='Mentions')]
        [switch]$Mentions,

        [ValidateNotNullOrEmpty()]
        [datetime]$StartTime,
        [ValidateNotNullOrEmpty()]
        [datetime]$EndTime,

        [ValidateNotNullOrEmpty()]
        [string]$SinceId,
        [ValidateNotNullOrEmpty()]
        [string]$UntilId,

        [switch]$IncludeExpansions,
        [switch]$NonPublicMetrics,
        [switch]$PromotedMetrics,
        [switch]$OrganicMetrics
    )

    $Request = [TwitterRequest]@{
        Endpoint = $Endpoint
        ExpansionType = 'Tweet'
        NonPublicMetrics = $NonPublicMetrics
        PromotedMetrics = $PromotedMetrics
        OrganicMetrics = $OrganicMetrics
        IncludeExpansions = $IncludeExpansions
        Query = @{ 'max_results' = 100 }
    }

    switch ($PSCmdlet.ParameterSetName) {
        'User' {
            $Request.Endpoint = 'https://api.twitter.com/2/users/{0}/tweets' -f $User.Id
            if ($PSBoundParameters.ContainsKey('Exclude')){
                $Request.Query.Add('exclude', ($Exclude.ToLower() -join ',') )
            }
        }
        'Mentions' {
            $Request.Endpoint = 'https://api.twitter.com/2/users/{0}/mentions' -f $User.Id
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

    Invoke-TwitterRequest -RequestParameters $Request
}
