function Publish-TwitterDM {
    [CmdletBinding(DefaultParameterSetName='DM')]
    param(
        [Parameter(Mandatory)]
        [ValidateLength(1,10000)]
        [string]$Message,

        [Parameter(Mandatory,ParameterSetName='DM',ValueFromPipeline)]
        [Parameter(Mandatory,ParameterSetName='DMWithMedia',ValueFromPipeline)]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='DMUserObject',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.UserInfo.User]$User,

        [Parameter(ParameterSetName='DM')]
        [Parameter(ParameterSetName='DMUserObject')]
        [ValidateNotNullOrEmpty()]
        [string]$MediaId,

        [Parameter(Mandatory,ParameterSetName='DMWithMedia')]
        [ValidateScript({Test-Path -Path $_})]
        [string]$Path,

        [Parameter(Mandatory,ParameterSetName='DMWithMedia')]
        [ValidateSet('DMImage','DMVideo','DMGif')]
        [string]$Category,

        [Parameter(ParameterSetName='DMWithMedia')]
        [ValidateLength(1,1000)]
        [string]$AltImageText
    )

    $MessageTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":{0}}},"message_data":{{"text":"{1}"}}}}}}}}'
    $MessageWithMediaTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":{0}}},"message_data":{{"text":"{1}","attachment":{{"type":"media","media":{{"id":{2}}}}}}}}}}}}}'

    if ($PSCmdlet.ParameterSetName -eq 'DMWithMedia') {
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
