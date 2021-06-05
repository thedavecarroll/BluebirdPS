function Import-TwitterAuthentication {
    [CmdletBinding()]
    param()

    'Checking Twitter credentials file.' | Write-Verbose

    if (Test-Path -Path $BluebirdPSConfiguration.CredentialsPath) {

        'Twitter credentials file found.' | Write-Verbose

        try {

            'Attempting to import Twitter credentials file.' | Write-Verbose

            # read the encrypted credentials file, decrypt, and convert from JSON to object
            $OAuthFromDisk = Get-Content -Path $BluebirdPSConfiguration.CredentialsPath | ConvertTo-SecureString -ErrorAction Stop |
                ConvertFrom-SecureString -AsPlainText | ConvertFrom-Json

            # ensure that the credentials file has the correct keys/attributes
            foreach ($OAuthKey in 'ApiKey','ApiSecret','AccessToken','AccessTokenSecret','BearerToken') {
                if ($OAuthFromDisk.psobject.Properties.Name -notcontains $OAuthKey) {
                    Write-Error -ErrorAction Stop
                }
            }

            # ensure that we have values for the four required keys
            if ($OAuthFromDisk.psobject.Properties.Where{$_.Name -ne 'BearerToken' -and $null -ne $_.Value}.count -eq 4) {

                $OAuth['ApiKey'] = $OAuthFromDisk.ApiKey
                $OAuth['ApiSecret'] = $OAuthFromDisk.ApiSecret
                $OAuth['AccessToken'] = $OAuthFromDisk.AccessToken
                $OAuth['AccessTokenSecret'] = $OAuthFromDisk.AccessTokenSecret
                $OAuth['BearerToken'] = $OAuthFromDisk.BearerToken

                'Twitter credentials file imported.' | Write-Verbose

                try {
                    Invoke-TwitterVerifyCredentials | Out-Null
                }
                catch {
                    'Authentication file appears to have invalid credentials. Please use the Set-TwitterAuthentication command to update your stored credentials.' | Write-Warning
                    return
                }
                if ($null -eq $BluebirdPSConfiguration.AuthUserId) {
                    Set-BluebirdPSAuthUser
                }
                try {
                    Invoke-TwitterVerifyCredentials -BearerToken | Out-Null
                }
                catch {
                    'Authentication file appears to have an invalid bearer token.','Please use the Set-TwitterBearerToken command to update your stored bearer token.' | Write-Warning
                    return
                }

                Export-BluebirdPSConfiguration

            } else {
                'Authentication file missing one or more values.','Please use the Set-TwitterAuthentication command to update the required API keys and secrets.' | Write-Warning
            }
        }
        catch {
            'Authentication file appears to be corrupted.','Please use the Set-TwitterAuthentication command to update the required API keys and secrets.' | Write-Warning
            $PSCmdlet.ThrowTerminatingError($_)
        }

    } else {
        'Please use the Set-TwitterAuthentication command to set the required API keys and secrets.','The authentication values will be encrypted and saved to disk.' | Write-Warning
    }
}
