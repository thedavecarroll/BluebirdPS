function Export-TwitterAuthentication {
    [CmdletBinding()]
    param()

    try {
        if (-Not (Test-Path -Path $OAuthTokenPath)) {
            $Action = 'new'
            New-Item -Path $OAuthTokenPath -Force -ItemType File | Out-Null
        } else {
            $Action = 'existing'
        }

        $OAuth | ConvertTo-Json | ConvertTo-SecureString -AsPlainText |
            ConvertFrom-SecureString | Set-Content -Path $OAuthTokenPath -Force

        'Saved Twitter credentials to {0} file: {1}' -f $Action,$OAuthTokenPath | Write-Verbose
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
