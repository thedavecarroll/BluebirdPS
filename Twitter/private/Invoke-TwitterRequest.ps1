function Invoke-TwitterRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [OAuthParameters]$OAuthParameters
    )

    try {
        $OAuthHeaderString = $OAuthParameters.GetOAuthSignatureString(
            $OAuth['ApiKey'],$OAuth['ApiSecret'],
            $OAuth['AccessToken'],$OAuth['AccessTokenSecret'],
            $null,$null
        )
        '{0}OAuthHeaderString:{0}{1}' -f [System.Environment]::NewLine,$OAuthHeaderString | Write-Verbose

        $WebRequestParams = @{
            Uri = $OAuthParameters.UriBuilder.Uri.AbsoluteUri
            Method = $OAuthParameters.HttpMethod
            Headers = @{ 'Authorization' = $OAuthHeaderString }
            ContentType = 'application/json'
            ResponseHeadersVariable = 'TwitterResponse'
            StatusCodeVariable = 'TwitterStatusCode'
            Verbose = $false
        }
        if ($OAuthParameters.Form) {
            $WebRequestParams.Add('Form',$OAuthParameters.Form)
        } elseif ($OAuthParameters.Body) {
            $WebRequestParams.Add('Body',$OAuthParameters.Body)
        }
        '{0}WebRequest Parameters:{0}{1}{0}' -f [System.Environment]::NewLine,($WebRequestParams.GetEnumerator() | Out-String).Trim() | Write-Verbose

        Invoke-RestMethod @WebRequestParams

        $ResponseData = [PsCustomObject]@{
            TwitterResponse = $TwitterResponse
            StatusCode = $TwitterStatusCode
            Uri = $OAuthParameters.BaseUri
            QueryString = $OAuthParameters.UriBuilder.Uri.Query
            HttpMethod = $OAuthParameters.HttpMethod
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