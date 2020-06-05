function New-ValidationErrorRecord {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Message,
        [Parameter(Mandatory)]
        [string]$Target,
        [Parameter(Mandatory)]
        [string]$ErrorId
    )

    [System.Management.Automation.ErrorRecord]::new(
        [ValidationMetadataException]::new($Message),
        $ErrorId,
        'InvalidArgument',
        $Target
    )
}