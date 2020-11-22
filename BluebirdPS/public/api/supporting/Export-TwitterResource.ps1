function Export-TwitterResource {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='Configuration')]
        [switch]$Configuration,
        [Parameter(Mandatory,ParameterSetName='Languages')]
        [switch]$Languages
    )

    if (-Not (Test-TwitterAuthentication)) {
        'Unable to connect to Twitter. Please use Set-TwitterAuthentication to set the requried API keys and secrets. Use the -Persist switch to save the values to disk.' | Write-Error -ErrorAction Stop
        return
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Configuration' {
            $Resource = Get-TwitterConfiguration
            $ResourceSavePath = $ConfigurationSavePath
        }
        'Languages' {
            $Resource = Get-TwitterLanguages
            $ResourceSavePath = $LanguagesSavePath
        }
    }

    try {
        $Resource | ConvertTo-Json | Set-Content -Path $ResourceSavePath -Force
        'Saved Twitter Languages to {0}' -f $ResourceSavePath | Write-Verbose
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
