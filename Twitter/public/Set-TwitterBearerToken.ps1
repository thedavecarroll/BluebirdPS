function Set-TwitterBearerToken {
    [CmdletBinding()]
    param(
        [switch]$Persist
    )

    try {
        $Credential = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(('{0}:{1}' -f $OAuth['ApiKey'],$OAuth['ApiSecret'])))
        $BasicAuth = 'Basic {0}' -f $Credential

        $WebRequestParams = @{
            Uri = 'https://api.twitter.com/oauth2/token'
            Method = 'POST'
            Headers = @{ 'Authorization' = $BasicAuth }
            ContentType = 'application/x-www-form-urlencoded'
            ResponseHeadersVariable = 'TwitterResponse'
            StatusCodeVariable = 'TwitterStatusCode'
            Body = 'grant_type=client_credentials'
            Verbose = $false
        }

        $Token = Invoke-RestMethod @WebRequestParams
        $OAuth['BearerToken'] = $Token.access_token

        if ($PSBoundParameters.ContainsKey('Persist')) {
            Export-TwitterAuthentication
        }

        $ResponseData = [PsCustomObject]@{
            TwitterResponse = $TwitterResponse
            StatusCode = $TwitterStatusCode
            Uri = $WebRequestParams.Uri
            QueryString = $null
            HttpMethod = $WebRequestParams.Method
        }
        $ResponseData | Write-TwitterResponseData

    }
    catch [Microsoft.PowerShell.Commands.HttpResponseException] {
        $_ | New-TwitterErrorRecord
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}