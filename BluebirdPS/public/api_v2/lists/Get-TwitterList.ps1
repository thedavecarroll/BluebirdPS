function Get-TwitterList {
    [OutputType(
        'BluebirdPS.APIV2.ListInfo.List',
        'BluebirdPS.APIV2.UserInfo.User'
    )]
    [CmdletBinding(DefaultParameterSetName='ByUser')]
    param(
        [Parameter(Mandatory,ParameterSetName='ByListId')]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(ParameterSetName='ByUser',ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [switch]$IncludeExpansions
    )

    if ($PSCmdlet.ParameterSetName -eq 'ByListId') {
        $Endpoint = 'https://api.twitter.com/2/lists/{0}' -f $Id
    } else {
        $UserId = $User.Id ? $User.Id : $BluebirdPSConfiguration.AuthUserId
        $Endpoint = 'https://api.twitter.com/2/users/{0}/owned_lists' -f $UserId
    }

    $Request = [TwitterRequest]@{
        ExpansionType = 'List'
        Endpoint = $Endpoint
        IncludeExpansions = $IncludeExpansions
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
