function Get-TwitterApiEndpoint {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string[]]$CommandName,
        [ValidateNotNullOrEmpty()]
        [string]$Endpoint
    )

    if ($PSBoundParameters.ContainsKey('Endpoint')) {
        $TwitterEndpoints | Where-Object {$_.ApiEndpoint -match $Endpoint } | Sort-Object -Property Visibility
    } else {
        $TwitterEndpoints | Where-Object {$_.CommandName -in $CommandName} | Sort-Object -Property Visibility
    }

}
