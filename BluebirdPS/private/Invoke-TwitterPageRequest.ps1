function Invoke-TwitterPageRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [OAuthParameters]$OAuthParameters,
        [Parameter(Mandatory)]
        [int]$Pages
    )

    'Incoming OAuthParameters:',$OAuthParameters | Write-Verbose

    $CurrentCount = 0
    $AllPages = @()

    for ($CurrentPage = 1 ; $CurrentPage -le $Pages; $CurrentPage++) {

        if ($OAuthParameters.Query.Keys -match 'page') {
            $OAuthParameters.Query.Remove('page')
        }
        $OAuthParameters.Query.Add('page',$CurrentPage)

        if ($CurrentPage -eq $Pages) {
            $Count = $MaxResults - $CurrentCount
        } else {
            $Count = 20
        }
        if ($OAuthParameters.Query.Keys -match 'count') {
            $OAuthParameters.Query.Remove('count')
        }
        $OAuthParameters.Query.Add('count',$Count)

        $OAuthParameters.SetQuery($OAuthParameters.Query)
        'OAuthParameters:',$OAuthParameters | Write-Verbose

        try {
            $PageRequest = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
            $AllPages = $AllPages + $PageRequest
            $CurrentCount = $CurrentCount + $Count
        }
        catch {
            $PSCmdlet.WriteError($_)
            break
        }
    }

    $AllPages
}