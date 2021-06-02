function Export-TwitterAuthentication {
    [CmdletBinding()]
    param()

    try {
        if (-Not (Test-Path -Path $BluebirdPSConfiguration.CredentialsPath)) {
            $Action = 'new'
            New-Item -Path $BluebirdPSConfiguration.CredentialsPath -Force -ItemType File | Out-Null
        } else {
            $Action = 'existing'
        }

        [SuppressMessage('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
        $OAuth | ConvertTo-Json | ConvertTo-SecureString -AsPlainText | ConvertFrom-SecureString | Set-Content -Path $BluebirdPSConfiguration.CredentialsPath -Force

        'Saved Twitter credentials to {0} file: {1}' -f $Action,$BluebirdPSConfiguration.CredentialsPath | Write-Verbose

        $BluebirdPSConfiguration.AuthLastExportDate = (Get-ChildItem -Path $BluebirdPSConfiguration.CredentialsPath).LastWriteTime
        Export-BluebirdPSConfiguration

    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
