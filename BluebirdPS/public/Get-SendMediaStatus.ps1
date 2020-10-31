function Get-SendMediaStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('media_id')]
        [string]$MediaId
    )

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://upload.twitter.com/1.1/media/upload.json',
        @{
            'command' = 'STATUS'
            'media_id' = $MediaId
        }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
