function New-TwitterErrorRecord {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [ErrorRecord]$ErrorRecord
    )

    try {

        $Command = (Get-PSCallStack).Where{$_.Command -notmatch 'ErrorRecord|ResponseData|Request|ScriptBlock'}.Command

        $Response = $ErrorRecord.Exception.Response
        if ($Response.Headers.ToString() -match '(?:x-response-time:\s)(\d+)') {
            $ResponseTime = $Matches[1]
        }

        if ($Response.RequestMessage.RequestUri.Query.Length -gt 0) {
            $Uri = $Response.RequestMessage.RequestUri.AbsoluteUri.Replace($Response.RequestMessage.RequestUri.Query,'')
        } else {
            $Uri = $Response.RequestMessage.RequestUri.AbsoluteUri
        }

        $Status = '{0} {1}' -f $Response.StatusCode.Value__,$Response.ReasonPhrase
        $Server = $Response.Headers.Where{$_.Key -eq 'server'}.Value

        try {
            if ($ErrorRecord.ErrorDetails) {
                $TwitterError = ($ErrorRecord.ErrorDetails.Message | ConvertFrom-Json).errors
                $ErrorCategory = $TwitterErrorMapping.Where{$_.ErrorCode -eq $TwitterError.code}.Exception
                $ErrorMessage = $TwitterError.message
                $ErrorCode = $TwitterError.code
            } else {
                $MappedError = $TwitterErrorMapping.Where{$_.HttpStatusCode -eq $Response.StatusCode.Value__}
                $ErrorCategory = $MappedError.Exception
                if ($MappedError.Message) {
                    $ErrorMessage = $MappedError.Message
                } else {
                    $ErrorMessage = $TwitterError.ReasonPhrase
                }
                $ErrorCode = $null
            }
        }
        catch {
            $ErrorCategory = $ErrorRecord.CategoryInfo.Category
            $ErrorMessage = $Response.StatusCode
            $ErrorCode = $null
        }

        $ResponseData = [PsCustomObject]@{
            PSTypeName = 'Twitter.Error'
            Command = $Command
            HttpMethod = $Response.RequestMessage.Method.ToString()
            Uri = $Uri
            QueryString = $Response.RequestMessage.RequestUri.Query
            Status = $Status
            Message = $ErrorMessage
            Server = $Server
            ResponseTime = $ResponseTime
            Response = $Response
            ErrorCode = $ErrorCode
        }
        $TwitterHistoryList.Add($ResponseData)
        Write-Information -MessageData $ResponseData

        $TwitterException = [HttpResponseException]::new($ErrorMessage,$Response)

        [ErrorRecord]::new($TwitterException,$Command,$ErrorCategory,$ResponseData.Uri)

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}