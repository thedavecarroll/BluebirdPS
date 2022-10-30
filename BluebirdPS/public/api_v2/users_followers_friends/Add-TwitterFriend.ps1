function Add-TwitterFriend {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $User = Get-TwitterUser -Id $Id
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/2/users/{0}/following' -f $BluebirdPSConfiguration.AuthUserId
        Body = '{{"target_user_id": "{0}"}}' -f $User.Id
    }

    try {
        $AddTwitterFriend = Invoke-TwitterRequest -RequestParameters $Request
        $Following = $AddTwitterFriend.following ? 'following' : 'not following'
        'You are {0} user {1}' -f $Following,$User.ToString()
        if ($AddTwitterFriend.pending_follow) {
            'There is a pending follow for user {1}' -f $User.ToString()
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
