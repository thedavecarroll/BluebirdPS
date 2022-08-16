function Set-TwitterMutedUser {
    [CmdletBinding(DefaultParameterSetName='Mute')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(ParameterSetName='Mute')]
        [switch]$Mute,

        [Parameter(Mandatory,ParameterSetName='Unmute')]
        [switch]$Unmute
    )

    $Request = [TwitterRequest]@{}
    if ($PSCmdlet.ParameterSetName -eq 'Mute') {
        $Request.HttpMethod = 'POST'
        $Request.Endpoint = 'https://api.twitter.com/2/users/{0}/muting' -f $BluebirdPSConfiguration.AuthUserId
        $Request.Body = [PSCustomObject]@{ 'target_user_id' = $User.Id } | ConvertTo-Json
    } else {
        $Request.HttpMethod = 'DELETE'
        $Request.Endpoint = 'https://api.twitter.com/2/users/{0}/muting/{1}' -f $BluebirdPSConfiguration.AuthUserId,$User.Id
    }

    $SetTwitterMutedUser = Invoke-TwitterRequest -RequestParameters $Request
    $Muting = $SetTwitterMutedUser ? 'muting' : 'not muting'
    'You are {0} user {1}' -f $Muting,$User.ToString()

}
