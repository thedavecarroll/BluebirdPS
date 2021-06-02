function Get-BluebirdPSHistory {
    [CmdletBinding()]
    param(
        [ValidateRange(1,[int]::MaxValue)]
        [int]$First,
        [ValidateRange(1,[int]::MaxValue)]
        [int]$Last,
        [ValidateRange(1,[int]::MaxValue)]
        [int]$Skip,
        [ValidateRange(1,[int]::MaxValue)]
        [int]$SkipLast,
        [switch]$Errors
    )

    $SelectObjectParams = @{}
    foreach ($Key in $PSBoundParameters.Keys) {
        if ($Key -notin [Cmdlet]::CommonParameters -and $Key -ne 'Errors') {
            $SelectObjectParams.Add($Key,$PSBoundParameters[$Key])
        }
    }

    if ($Errors.IsPresent) {
        $SelectObjectParams.Add(
            'Property',
            @(
                'Command',
                'Status'
                @{l='Errors';e= {
                    if ($_.ApiResponse.Errors.Detail) {
                        $_.ApiResponse.Errors.Detail
                    } elseif ($_.ApiResponse.Errors.Message) {
                        $_.ApiResponse.Errors.Message
                    }
                }}
            )
        )
    }

    $BluebirdPSHistoryList | Select-Object @SelectObjectParams
}
