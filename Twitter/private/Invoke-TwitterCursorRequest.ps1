function Invoke-TwitterCursorRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [OAuthParameters]$OAuthParameters
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
            Invoke-TwitterRequest -OAuthParameters $OAuthParameters -OutVariable TwitterRequest
            if ($TwitterRequest -is [System.Management.Automation.ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($TwitterRequest)
            }
            $NextCursor = $TwitterRequest.next_cursor
        }
        catch {
            $PSCmdlet.WriteError($_)
            break
        }

    } while ($NextCursor -ne 0)
}
