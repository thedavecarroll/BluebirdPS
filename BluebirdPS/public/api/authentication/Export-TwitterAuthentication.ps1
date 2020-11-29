function Export-TwitterAuthentication {
    [CmdletBinding()]
    param()

    try {
        if (-Not (Test-Path -Path $OAuthTokenSavePath)) {
            $Action = 'new'
            New-Item -Path $OAuthTokenSavePath -Force -ItemType File | Out-Null
        } else {
            $Action = 'existing'
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
        $OAuth | ConvertTo-Json | ConvertTo-SecureString -AsPlainText | ConvertFrom-SecureString | Set-Content -Path $OAuthTokenSavePath -Force

        'Saved Twitter credentials to {0} file: {1}' -f $Action,$OAuthTokenSavePath | Write-Verbose
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
