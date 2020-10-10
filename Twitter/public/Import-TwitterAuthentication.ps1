function Import-TwitterAuthentication {
    [CmdletBinding()]
    param()

    'Checking Twitter credentials file.' | Write-Verbose

    $SetValues = 'Please use Set-TwitterAuthentication to set the requried API keys and secrets. Use the -Persist switch to save the values to disk.'

    if (Test-Path -Path $OAuthTokenPath) {

        'Twitter credentials file found.' | Write-Verbose

        try {

            'Attempting to import Twitter credentials file.' | Write-Verbose

            # read the encrypted credentials file, decrypt, and convert from JSON to object
            $OAuthFromDisk = Get-Content -Path $OAuthTokenPath | ConvertTo-SecureString -ErrorAction Stop |
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

            } else {
                'Authentication file missing one or more values. {0}' -f $SetValues | Write-Warning
            }
        }
        catch {
            'Authentication file appears to be corrupted. {0}' -f $SetValues | Write-Warning
        }

    } else {
        $SetValues | Write-Warning
    }
}
