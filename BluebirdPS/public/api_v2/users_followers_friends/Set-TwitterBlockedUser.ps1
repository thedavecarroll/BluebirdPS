function Set-TwitterBlockedUser {
    [CmdletBinding(DefaultParameterSetName='Block')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(ParameterSetName='Block')]
        [switch]$Block,

        [Parameter(Mandatory,ParameterSetName='Unblock')]
        [switch]$Unblock
    )

   if ($PSCmdlet.ParameterSetName -eq 'Block') {
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint = 'https://api.twitter.com/2/users/{0}/blocking' -f $BluebirdPSConfiguration.AuthUserId
            Body = '{{"target_user_id": "{0}"}}' -f $User.Id
        }
    } else {
        $Request = [TwitterRequest]@{
            HttpMethod = 'DELETE'
            Endpoint = 'https://api.twitter.com/2/users/{0}/blocking/{1}' -f $BluebirdPSConfiguration.AuthUserId,$User.Id
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
