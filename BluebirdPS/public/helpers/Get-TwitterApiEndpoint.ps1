function Get-TwitterApiEndpoint {
    [OutputType('Get-TwitterApiEndpoint')]
    [CmdletBinding()]
    param(
        [Parameter()]
        [string[]]$CommandName,
        [ValidateNotNullOrEmpty()]
        [string]$Endpoint
    )

    if ($PSBoundParameters.ContainsKey('Endpoint')) {
        $TwitterEndpoints | Where-Object {$_.ApiEndpoint -match $Endpoint }
    } elseif ($PSBoundParameters.ContainsKey('CommandName')) {
        $TwitterEndpoints | Where-Object {$_.CommandName -in $CommandName}
    } else {
        $TwitterEndpoints
    }

}
