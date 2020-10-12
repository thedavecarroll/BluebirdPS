function Invoke-TwitterCursorRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [OAuthParameters]$OAuthParameters,
        [string]$ReturnValue
    )

    if ($OAuthParameters.BaseUri -eq 'https://api.twitter.com/1.1/direct_messages/events/list.json') {
        $NextCursor = 0
    } else {
        $NextCursor = -1
    }

    do {

        if ($OAuthParameters.Query.Keys -match 'cursor') {
            $OAuthParameters.Query.Remove('cursor')
        }
        $OAuthParameters.Query.Add('cursor',$NextCursor)
        $OAuthParameters.SetQuery($OAuthParameters.Query)

        try {
            $TwitterRequest = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
            if ($TwitterRequest -is [System.Management.Automation.ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($TwitterRequest)
            }

            if ($TwitterRequest.psobject.Properties.Name -contains $ReturnValue) {
                $TwitterRequest.$ReturnValue
            } else {
                $TwitterRequest
            }

            $NextCursor = $TwitterRequest.next_cursor
        }
        catch {
            $PSCmdlet.WriteError($_)
            break
        }

    } while ($NextCursor -ne 0)
}
