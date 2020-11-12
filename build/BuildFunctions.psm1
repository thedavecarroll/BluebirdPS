function Import-TwitterApiEndpoints {
    [CmdletBinding()]
    param($Path)

    try {
        $EndpointJSON = Get-ChildItem -Path (Join-Path -Path $Path -ChildPath '*-*.json')
        $TwitterApiEndpoints = [hashtable]::new()
        foreach ($Json in $EndpointJSON) {
            $JsonContents = Get-Content $Json -Raw | ConvertFrom-Json -AsHashtable
            if ($TwitterApiEndpoints.ContainsKey($JsonContents.Resource)) {
                foreach ($Endpoint in $JsonContents.Endpoints.Keys) {
                    if ($TwitterApiEndpoints[$JsonContents.Resource].ContainsKey($Endpoint)) {
                        'Replacing endpoint {0} on resource {1}' -f $Endpoint,$JsonContents.Resource | Write-Verbose
                        #$TwitterApiEndpoints[$JsonContents.Resource].$Endpoint.Add($Endpoint,$JsonContents.Endpoints.$Endpoint)
                    } else {
                        'Adding endpoint {0} to resource {1}' -f $Endpoint,$JsonContents.Resource | Write-Verbose
                        $TwitterApiEndpoints[$JsonContents.Resource].Add($Endpoint,$JsonContents.Endpoints.$Endpoint)
                    }
                }
            } else {
                'Adding new resource {0} and all endpoints' -f $JsonContents.Resource | Write-Verbose
                $TwitterApiEndpoints.Add($JsonContents.Resource,$JsonContents.Endpoints)
            }
        }
        [PsCustomObject]$TwitterApiEndpoints
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}