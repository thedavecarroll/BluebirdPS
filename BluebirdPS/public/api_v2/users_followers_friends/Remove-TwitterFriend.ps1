function Remove-TwitterFriend {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $UserId = $Id
        $User = Get-TwitterList -Id $Id
    } else {
        $UserId = $User.Id
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'DELETE'
        Endpoint = 'https://api.twitter.com/2/users/{0}/following/{1}' -f $BluebirdPSConfiguration.AuthUserId,$UserId
    }

    if ($PSCmdlet.ShouldProcess($User.ToString(), 'Unfollow user')) {
        $RemoveTwitterFriend = Invoke-TwitterRequest -RequestParameters $Request
        $Following = $RemoveTwitterFriend ? 'following' : 'not following'
        'You are {0} user {1}' -f $Following,$User.ToString()
    }
}
