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

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Query = @{ 'screen_name' = $User.UserName }
    }

    if ($PSCmdlet.ParameterSetName -eq 'Mute') {
        $Request.Endpoint = 'https://api.twitter.com/1.1/mutes/users/create.json'
    } else {
        $Request.Endpoint = 'https://api.twitter.com/1.1/mutes/users/destroy.json'
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
