function Get-TwitterFriends {
    [CmdletBinding(DefaultParameterSetName='ById')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(
        [Parameter(ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [switch]$IncludeExpansions,

        [ValidateRange(1,1000)]
        [int]$MaxResultsPerPage=1000,
        [switch]$NoPagination
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            if ($PSBoundParameters.ContainsKey('Id')) {
                $Endpoint = 'https://api.twitter.com/2/users/{0}/following' -f $Id
            } else {
                $Endpoint = 'https://api.twitter.com/2/users/{0}/following' -f $BluebirdPSConfiguration.AuthUserId
            }
        }
        'ByUser' {
            $Endpoint = 'https://api.twitter.com/2/users/{0}/following' -f $User.Id
        }
    }
    if ($MaxResultsPerPage -lt 1000) {
        $NoPagination = $true
    }

    $Request = [TwitterRequest]@{
        Endpoint = $Endpoint
        Query = @{'max_results' = $MaxResultsPerPage }
        ExpansionType = 'User'
        IncludeExpansions = $IncludeExpansions
        NoPagination = $NoPagination
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
