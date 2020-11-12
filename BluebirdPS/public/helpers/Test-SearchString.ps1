function Test-SearchString {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$SearchString
    )

    try {
        if ([System.Uri]::EscapeDataString($SearchString).Length -gt 500) {
            'The SearchString provided exceeded 500 characters. Please try again.' | Write-Error -ErrorAction Stop
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}