function Get-SendMediaStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('media_id')]
        [string]$MediaId
    )

    $Query = @{
        'command' = 'STATUS'
        'media_id' = $MediaId
    }
    $OAuthParameters = [OAuthParameters]::new('GET','https://upload.twitter.com/1.1/media/upload.json',$Query)

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}