function Publish-TwitterDM {
    [CmdletBinding(DefaultParameterSetName='DMUserId')]
    param(
        [string]$Message,

        [Parameter(Mandatory,ParameterSetName='DMUserId',ValueFromPipeline)]
        [Parameter(Mandatory,ParameterSetName='DMUserIdWithMedia',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='DMUserObject',ValueFromPipeline)]
        [Parameter(Mandatory,ParameterSetName='DMUserObjectWithMedia',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(ParameterSetName='DMUserId')]
        [Parameter(ParameterSetName='DMUserObject')]
        [ValidateNotNullOrEmpty()]
        [string]$MediaId,

        [Parameter(Mandatory,ParameterSetName='DMUserIdWithMedia')]
        [Parameter(Mandatory,ParameterSetName='DMUserObjectWithMedia')]
        [ValidateScript({Test-Path -Path $_})]
        [string]$Path,

        [Parameter(Mandatory,ParameterSetName='DMUserIdWithMedia')]
        [Parameter(Mandatory,ParameterSetName='DMUserObjectWithMedia')]
        [ValidateSet('DMImage','DMVideo','DMGif')]
        [string]$Category,

        [Parameter(ParameterSetName='DMUserIdWithMedia')]
        [Parameter(ParameterSetName='DMUserObjectWithMedia')]
        [ValidateLength(1,1000)]
        [string]$AltImageText
    )

    $MessageTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":{0}}},"message_data":{{"text":"{1}"}}}}}}}}'
    $MessageWithMediaTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":{0}}},"message_data":{{"text":"{1}","attachment":{{"type":"media","media":{{"id":{2}}}}}}}}}}}}}'

    if ($PSCmdlet.ParameterSetName -match 'WithMedia') {
        $TwitterMediaParams = @{
            Path = $Path
            Category = $Category
        }
        if ($AltImageText) {
            $TwitterMediaParams.Add('AltImageText',$AltImageText)
        }
        $MediaId = Send-TwitterMedia @TwitterMediaParams | Select-Object -ExpandProperty media_id
    }

    $RecipientId = $PSCmdlet.ParameterSetName -match 'DMUserObject' ? $User.Id : $Id
    $MessageText = [string]::IsNullOrEmpty($Message) ? [string]::Empty : $Message

    if ($MessageText) {
        if ($MediaId) {
            $Body = $MessageWithMediaTemplate -f $RecipientId,$MessageText,$MediaId
        } else {
            $Body = $MessageTemplate -f $RecipientId,$MessageText
        }
    } else {
        'You must provide a message, media, or a message and media. Please try again.' | Write-Warning
        return
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/direct_messages/events/new.json'
        Body = $Body.Replace("`r`n",'\n')
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
