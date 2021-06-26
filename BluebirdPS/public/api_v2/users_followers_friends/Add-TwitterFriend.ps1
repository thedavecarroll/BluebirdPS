function Add-TwitterFriend {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByUser',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ById' {
            $Body = '{{"target_user_id": "{0}"}}' -f $Id
        }
        'ByUser' {
            $Body = '{{"target_user_id": "{0}"}}' -f $User.Id
        }
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/2/users/{0}/following' -f $BluebirdPSConfiguration.AuthUserId
        Body = $Body
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
