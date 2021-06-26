function Remove-TwitterFriend {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User
    )

    $UserId = $PSCmdlet.ParameterSetName -eq 'ById' ? $Id : $User.Id

    $Request = [TwitterRequest]@{
        HttpMethod = 'DELETE'
        Endpoint = 'https://api.twitter.com/2/users/{0}/following/{1}' -f $BluebirdPSConfiguration.AuthUserId,$UserId
    }

    if ($PSCmdlet.ShouldProcess($UserId, 'Unfollow user')) {
        Invoke-TwitterRequest -RequestParameters $Request
    }
}
