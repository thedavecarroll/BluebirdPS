#requires -version 7.0

class OAuthParameters {
    [string]$HttpMethod
    [String]$BaseUri
    [hashtable]$Query
    [System.UriBuilder]$UriBuilder
    [string]$UnescapedQueryString
    [string]$EscapedQueryString
    [object]$Body
    [hashtable]$Form

    # ------------------------------------------------------------------------------------------------------------------
    # constructor for OAuthParameters
    # ------------------------------------------------------------------------------------------------------------------

    OAuthParameters ([string] $HttpMethod, [string] $BaseUri, [hashtable] $Query) {
        $this.SetHttpMethod($HttpMethod)
        $this.SetBaseUri($BaseUri)
        $this.SetQuery($Query)
    }

    OAuthParameters ([string] $HttpMethod, [string] $BaseUri) {
        $this.SetHttpMethod($HttpMethod)
        $this.SetBaseUri($BaseUri)
    }

    # ------------------------------------------------------------------------------------------------------------------
    # methods
    # ------------------------------------------------------------------------------------------------------------------

    # generates the required OAuth signature string
    # Nonce and Timestamp are variables in order to support testing
    [string] GetOAuthSignatureString (
        [string]$ApiKey,[string]$ApiSecret,
        [string]$AccessToken,[string]$AccessTokenSecret,
        [string]$Nonce,[string]$Timestamp
    ) {
        if ([System.String]::IsNullOrEmpty($Nonce)) {
            $Nonce = $this.GetNonce()
        }
        if ([System.String]::IsNullOrEmpty($Timestamp)) {
            $Timestamp = $this.GetUnixTime()
        }

        # get parameter string
        $ParameterString = $this.GetParameterString($ApiKey,$AccessToken,$Nonce,$Timestamp)

        # create signature base
        $SignatureBaseString = '{0}&{1}&{2}' -f $this.HttpMethod,
            [System.Uri]::EscapeDataString($this.BaseUri),
            [System.Uri]::EscapeDataString($ParameterString)

        # set signing key
        $SigningKey = '{0}&{1}' -f [System.Uri]::EscapeDataString($ApiSecret),
            [System.Uri]::EscapeDataString($AccessTokenSecret)

        # generate OAuth signature
        $SignatureMethod = [System.Security.Cryptography.HMACSHA1]::new()
        $SignatureMethod.Key = [System.Text.Encoding]::ASCII.GetBytes($SigningKey)
        $OAuthSignature = [System.Convert]::ToBase64String(
            $SignatureMethod.ComputeHash([System.Text.Encoding]::ASCII.GetBytes($SignatureBaseString))
        )

        # add OAuth signature to header
        $OAuthHeader = $this.GetOAuthHeader($ApiKey,$AccessToken,$Nonce,$Timestamp)
        $OAuthHeader.Add('oauth_signature',$OAuthSignature)

        # escape OAuth key
        $OAuthHeaderString = $OAuthHeader.GetEnumerator() |
            Sort-Object Name |
            ForEach-Object {
                '{0}="{1}"' -f $_.Key,[System.Uri]::EscapeDataString($_.Value)
            }

        # build OAuth sstring
        $OAuthString = [System.Text.StringBuilder]::new()
        $null = $OAuthString.Append('OAuth ')
        $null = $OAuthString.Append(($OAuthHeaderString -join ', '))

        return $OAuthString.ToString()
    }

    # used to update Query, UnescapedQueryString, and UriBuilder
    # required for cursoring and paging
    [void] SetQuery($Query) {
        $this.Query = $Query
        $UriQueryString = [System.Collections.Generic.List[string]]::new()
        $this.Query.Keys | Sort-Object | Foreach-Object {
            $null = $UriQueryString.Add(('{0}={1}' -f $_,$this.Query[$_]))
        }
        $this.UnescapedQueryString = $UriQueryString -join '&'
        $this.UriBuilder = ($null -ne $this.Query) ? '{0}?{1}' -f $this.BaseUri,$this.UnescapedQueryString : $this.BaseUri
        $this.EscapedQueryString = $this.UriBuilder.Uri.Query.Substring(1)
    }

    # provide simple way to include text output
    [string] ToString() {

        $QueryObject = [PsCustomObject][ordered]@{}
        foreach ($Key in ($this.Query.Keys | Sort-Object)) {
            $QueryObject | Add-Member -MemberType NoteProperty -Name $Key -Value $this.Query[$Key]
        }

        $OAuthParametersString = [PsCustomObject]@{
            HttpMethod = $this.HttpMethod
            BaseUri = $this.BaseUri
            Query = ($QueryObject | Format-List | Out-String).Trim()
            Uri = $this.UriBuilder.Uri.AbsoluteUri
            UnescapedQueryString = $this.UnescapedQueryString
            EscapedQueryString = $this.EscapedQueryString
            Body = $this.Body
            Form = $this.Form
        }

        return $OAuthParametersString | Format-List | Out-String
    }

    # ------------------------------------------------------------------------------------------------------------------
    # hidden methods
    # note - only visible when using 'Get-Member -Force'
    #      - the setter and getter methods for the class properties will be revealed with -Force
    # ------------------------------------------------------------------------------------------------------------------

    # generate random base64 encoding 32 bytes
    hidden [string] GetNonce() {
        $NumberBytes = [Byte[]]::new(32)
        $Random = [System.Security.Cryptography.RandomNumberGenerator]::Create()
        $Random.GetBytes($NumberBytes)
        $Random.Dispose()
        return [System.Convert]::ToBase64String($NumberBytes)
    }

    # generate UNIX epoch time
    hidden [long] GetUnixTime(){
        return [long]([datetime]::Now - [DateTime]::new(1970,1,1,0,0,0,[DateTimeKind]::Utc)).TotalSeconds
    }

    # create the base OAuth Headers
    hidden [hashtable] GetOAuthHeader($ApiKey,$AccessToken,$Nonce,$Timestamp) {
        return @{
            oauth_consumer_key = $ApiKey
            oauth_nonce = $Nonce
            oauth_signature_method = 'HMAC-SHA1'
            oauth_timestamp = $Timestamp
            oauth_token = $AccessToken
            oauth_version = '1.0'
        }
    }

    hidden [string] GetParameterString($ApiKey,$AccessToken,$Nonce,$Timestamp) {

        # get OAuthHeader
        $OAuthHeader = $this.GetOAuthHeader($ApiKey,$AccessToken,$Nonce,$Timestamp)

        # collect parameters
        $Parameters = @{}
        foreach ($Key in $this.Query.Keys) {
            $Parameters.Add($Key,$this.Query[$Key])
        }
        <#foreach ($Key in $this.Query.Keys) {
            if ([System.Uri]::UnescapeDataString($this.Query[$Key]) -eq $this.Query[$Key]) {
                $ParamValue = [System.Uri]::EscapeDataString($this.Query[$Key])
            } else {
                $ParamValue = $this.Query[$Key]
            }
            $Parameters.Add(
                [System.Uri]::EscapeDataString($Key),
                $ParamValue
                #[System.Uri]::EscapeDataString($ParamValue)
            )
        }#>

        # append OAuth header
        foreach ($Key in $OAuthHeader.Keys) {
            $Parameters.Add($Key,$OAuthHeader[$Key])
        }

        # build parameter string, esnure that every key and value have been escaped only once
        $ParameterString = $Parameters.GetEnumerator() |
            Sort-Object -Property Name |
            ForEach-Object {
                $EscapedKey = ([System.Uri]::UnescapeDataString($_.Key) -eq $_.Key) ? [System.Uri]::EscapeDataString($_.Key) : $_.Key
                $EscapedValue = ([System.Uri]::UnescapeDataString($_.Value) -eq $_.Value) ? [System.Uri]::EscapeDataString($_.Value) : $_.Value
                '{0}={1}' -f $EscapedKey, $EscapedValue
            }

        return $ParameterString -join '&'
    }

    hidden [void] SetHttpMethod($HttpMethod) {
        if ($HttpMethod -match '\bGET\b|\bPOST\b|\bDELETE\b|\bPATCH\b|\bPUT\b|\bHEAD\b|\bOPTIONS\b|\bTRACE\b') {
            $this.HttpMethod = $HttpMethod.ToUpper()
        } else {
            throw "The value supplied for HttpMethod [$HttpMethod] is not a valid HTTP method."
        }
    }

    # maintain base uri separately as it will be used in GetOAuthSignatureString() method and in calling function
    hidden [void] SetBaseUri($BaseUri) {
        $this.BaseUri = $BaseUri
        $this.UriBuilder = $this.BaseUri
    }

}