function Get-TwitterListMember {
    [OutputType(
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.TweetInfo.Tweet'
    )]
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [switch]$IncludeExpansions,

        [ValidateRange(1,100)]
        [int]$MaxResultsPerPage=100,
        [switch]$NoPagination
    )

    $ListId = $PSCmdlet.ParameterSetName -eq 'ById' ? $Id : $List.Id

    if ($MaxResultsPerPage -lt 100) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint ='https://api.twitter.com/2/lists/{0}/members' -f $ListId
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
