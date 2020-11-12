function Test-TwitterAuthentication {
    [CmdletBinding()]
    param()

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/account/verify_credentials.json',
        @{
            include_entities = 'false'
            skip_status = 'true'
        }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters -InformationVariable Response | Out-Null
    $Response.MessageData.Status -match '200' ? $true : $false
}
