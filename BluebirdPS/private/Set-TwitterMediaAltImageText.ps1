function Set-TwitterMediaAltImageText {
    [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('media_id')]
        [string]$MediaId,

        [ValidateLength(1,1000)]
        [string]$AltImageText
    )

    $OAuthParameters = [OAuthParameters]::new(
        'POST',
        'https://upload.twitter.com/1.1/media/metadata/create.json'
    )

    $OAuthParameters.Body = ('{{"media_id":"{0}","alt_text":{{"text":"{1}"}}}}' -f $MediaId,$AltImageText)
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}