function Set-TwitterMediaAltImageText {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [Alias('media_id')]
        [string]$MediaId,

        [Parameter(Mandatory)]
        [ValidateLength(1,1000)]
        [string]$AltImageText
    )

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://upload.twitter.com/1.1/media/metadata/create.json'
    }

    $Request.Body = '{{"media_id":"{0}","alt_text":{{"text":"{1}"}}}}' -f $MediaId,$AltImageText
    Invoke-TwitterRequest -RequestParameters $Request
}