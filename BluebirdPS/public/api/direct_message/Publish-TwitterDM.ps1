function Publish-TwitterDM {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]$UserId,

        [Parameter(Mandatory)]
        [ValidateLength(1,10000)]
        [string]$Message,

        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias('media_id')]
        [string]$MediaId
    )

    $MessageTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":"{0}"}},"message_data":{{"text":"{1}"}}}}}}}}'
    $MessageWithMediaTemplate = '{{"event":{{"type":"message_create","message_create":{{"target":{{"recipient_id":"{0}"}},"message_data":{{"text":"{1}","attachment":{{"type":"media","media":{{"id":{2}}}}}}}}}}}}}'

    $OAuthParameters = [OAuthParameters]::new(
        'POST',
        'https://api.twitter.com/1.1/direct_messages/events/new.json'
    )

    if ($PSBoundParameters.ContainsKey('MediaId')) {
        $Body = $MessageWithMediaTemplate -f $UserId,$Message,$MediaId
    } else {
        $Body = $MessageTemplate -f $UserId,$Message
    }

    $OAuthParameters.Body = $Body.Replace("`r`n",'\n')

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
