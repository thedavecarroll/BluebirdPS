function Export-BluebirdPSConfiguration {
    [CmdletBinding()]
    param()

    try {
        if (-Not (Test-Path -Path $BluebirdPSConfiguration.ConfigurationPath)) {
            $Action = 'new'
            New-Item -Path $BluebirdPSConfiguration.ConfigurationPath -Force -ItemType File | Out-Null
        } else {
            $Action = 'existing'
        }

        $BluebirdPSConfiguration.AuthLastExportDate = (Get-ChildItem -Path $BluebirdPSConfiguration.CredentialsPath).LastWriteTime

        $BluebirdPSConfiguration | ConvertTo-Json | Set-Content -Path $BluebirdPSConfiguration.ConfigurationPath -Force

        'Saved BluebirdPS Configuration to {0} file: {1}' -f $Action,$BluebirdPSConfiguration.ConfigurationPath | Write-Verbose

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
