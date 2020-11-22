function Test-SearchString {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString
    )

    if ([System.Uri]::EscapeDataString($SearchString).Length -gt 500) {
        $false
    } else {
        $true
    }
}
