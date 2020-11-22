function Get-TwitterHistory {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(ParameterSetName='First')]
        [ValidateRange(1,[int]::MaxValue)]
        [int]$First,
        [Parameter(ParameterSetName='Last')]
        [ValidateRange(1,[int]::MaxValue)]
        [int]$Last
    )

    switch ($PSCmdlet.ParameterSetName) {
        'First' {
            $TwitterHistoryList | Select-Object -First $First
        }
        'Last' {
            $TwitterHistoryList | Select-Object -Last $Last
        }
        default {
            $TwitterHistoryList
        }
    }

}