function Export-TwitterResource {
    [CmdletBinding(DefaultParameterSetName='Configuration')]
    param(
        [Parameter(Mandatory,ParameterSetName='Configuration')]
        [switch]$Configuration,
        [Parameter(Mandatory,ParameterSetName='Languages')]
        [switch]$Languages
    )

    if (-Not (Test-TwitterAuthentication -Verbose:$false)) {
        'Unable to connect to Twitter. Please use Set-TwitterAuthentication to set the requried API keys and secrets. Use the -Persist switch to save the values to disk.' | Write-Error -ErrorAction Stop
        return
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Configuration' {
            $Resource = Get-TwitterConfiguration -Verbose:$false
            $ResourceSavePath = $ConfigurationSavePath
        }
        'Languages' {
            $Resource = Get-TwitterLanguages -Verbose:$false
            $ResourceSavePath = $LanguagesSavePath
        }
    }

    try {
        $Resource | ConvertTo-Json | Set-Content -Path $ResourceSavePath -Force
        'Saved Twitter {0} to {1}' -f $PSCmdlet.ParameterSetName,$ResourceSavePath | Write-Verbose
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
