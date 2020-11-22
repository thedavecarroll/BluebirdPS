function Get-SendMediaStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('media_id')]
        [string]$MediaId,

        [ValidateRange(1,[int]::MaxValue)]
        [int]$WaitSeconds
    )

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://upload.twitter.com/1.1/media/upload.json',
        @{
            'command' = 'STATUS'
            'media_id' = $MediaId
        }
    )

    if ($PSBoundParameters.ContainsKey('WaitSeconds')) {
        $StatusCheck = 0
        do {

            $StatusCheck++
            $Activity = 'Waiting {0} seconds before refreshing upload status for media id {1}' -f $WaitSeconds, $MediaId
            $CurrentOperation = 'Check status #{0}' -f $StatusCheck
            $Status = 'Total seconds waited {0}' -f $TotalWaitSeconds
            Write-Progress -Activity $Activity -CurrentOperation $CurrentOperation -Status $Status

            Start-Sleep -Seconds $WaitSeconds
            $TotalWaitSeconds += $WaitSeconds

            $SendMediaStatus = Invoke-TwitterRequest -OAuthParameters $OAuthParameters
            if ($SendMediaStatus -is [ErrorRecord]) {
                $PSCmdlet.ThrowTerminatingError($SendMediaStatus)
            }

            if ($SendMediaStatus.'processing_info'.'error') {
                $SendMediaStatus.'processing_info'.'error' | Write-Error -ErrorAction Stop
            }
            if ($SendMediaStatus.'processing_info'.'check_after_secs') {
                $WaitSeconds = $SendMediaStatus.'processing_info'.'check_after_secs' -as [int]
            }

        } while ($SendMediaStatus.'processing_info'.'state' -eq 'in_progress')
        Write-Progress -Activity "Media upload status check completed" -Completed

        $SendMediaStatus

    } else {
        Invoke-TwitterRequest -OAuthParameters $OAuthParameters
    }

}
