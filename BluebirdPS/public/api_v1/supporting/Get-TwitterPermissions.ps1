function Get-TwitterPermissions {
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param()
    try {
        $AccessLevel = $LastHeaders.'x-access-level'
        switch ($AccessLevel) {
            'read-write-directmessages' { 'Read/Write/DirectMessages'}
            'read-write' { 'Read/Write' }
            'read' { 'ReadOnly' }
        }
    } catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
