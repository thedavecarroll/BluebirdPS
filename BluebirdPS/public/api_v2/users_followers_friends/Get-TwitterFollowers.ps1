function Get-TwitterFollowers {
    [CmdletBinding(DefaultParameterSetName='ById')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param(
        [Parameter(ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [switch]$IncludeExpansions
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            if ($PSBoundParameters.ContainsKey('Id')) {
                $Endpoint = 'https://api.twitter.com/2/users/{0}/followers' -f $Id
            } else {
                $Endpoint = 'https://api.twitter.com/2/users/{0}/followers' -f $BluebirdPSConfiguration.AuthUserId
            }
        }
        'ByUser' {
            $Endpoint = 'https://api.twitter.com/2/users/{0}/followers' -f $User.Id
        }
    }

    $Request = [TwitterRequest]@{
        ExpansionType = 'User'
        Endpoint = $Endpoint
        Query = @{'max_results' = 1000 }
        IncludeExpansions = $IncludeExpansions
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
