function Get-TwitterListTweets {
    [CmdletBinding(DefaultParameterSetName='ById')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(

        [Parameter(Mandatory,ParameterSetName='ById')]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV1.List]$List,

        [string]$SinceId,
        [string]$MaxId,

        [switch]$ExcludeRetweets
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/statuses.json'
        Query = @{
            count = 200
        }
    }

    if ($PSBoundParameters.ContainsKey('SinceId')) {
        $Request.Query.Add('since_id',$SinceId)
    }
    if ($PSBoundParameters.ContainsKey('MaxId')) {
        $Request.Query.Add('max_id',$MaxId)
    }

    if ($ExcludeRetweets.IsPresent) {
        $Request.Query.Add('include_rts',$false)
        $RetweetInfo = ', including retweets,'
    }

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Request.Query.Add('list_id',$Id)
            $ListInfo = 'Id: {0}' -f $Id
        }
        'ByList' {
            $Request.Query.Add('list_id',$List.Id)
            $ListInfo = 'Id: {0}, Name: {1}' -f $List.Id,$List.Name
        }
    }

    'Getting tweets{0} for list: {1}' -f $RetweetInfo,$ListInfo | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request
}
