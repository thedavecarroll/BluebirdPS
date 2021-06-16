function Import-TwitterAuthentication {
    [CmdletBinding()]
    param()

    'Checking for Twitter authentication.' | Write-Verbose

    $BluebirdPSAuthEnvPaths =
        'env:BLUEBIRDPS_API_KEY',
        'env:BLUEBIRDPS_API_SECRET',
        'env:BLUEBIRDPS_ACCESS_TOKEN',
        'env:BLUEBIRDPS_ACCESS_TOKEN_SECRET'

        $BluebirdPSBearerTokenEnvPath = 'env:BLUEBIRDPS_BEARER_TOKEN'

    if ((Test-Path -Path $BluebirdPSAuthEnvPaths) -notcontains $false) {
        'Importing Twitter authentication from environment variables.' | Write-Verbose

        $OAuth['ApiKey'] = $env:BLUEBIRDPS_API_KEY
        $OAuth['ApiSecret'] = $env:BLUEBIRDPS_API_SECRET
        $OAuth['AccessToken'] = $env:BLUEBIRDPS_ACCESS_TOKEN
        $OAuth['AccessTokenSecret'] = $env:BLUEBIRDPS_ACCESS_TOKEN_SECRET

        if (Test-Path -Path $BluebirdPSBearerTokenEnvPath) {
            $OAuth['BearerToken'] = $env:BLUEBIRDPS_BEARER_TOKEN
        }

    } elseif (Test-Path -Path $BluebirdPSConfiguration.CredentialsPath) {

        try {
            'Importing Twitter authentication from credentials file.' | Write-Verbose

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
            }

            if ($null -ne $OAuthFromDisk.BearerToken) {
                $OAuth['BearerToken'] = $OAuthFromDisk.BearerToken
            }
        }
        catch {
            'Unable to import Twitter authentication data from credentials file.',
            'Please use the Set-TwitterAuthentication command to update the required API keys and secrets.' | Write-Warning
            $PSCmdlet.ThrowTerminatingError($_)
        }
    } else {
        'Twitter authentication data was not discovered in environment variables or on disk in credentials file.',
        'Please use the Set-TwitterAuthentication command to set the required API keys and secrets.',
        'The authentication values will be encrypted and saved to disk.' | Write-Warning
        return
    }

    try {
        Invoke-TwitterVerifyCredentials | Out-Null
    }
    catch {
        'Twitter authentication data appears to be invalid.','Please use the Set-TwitterAuthentication command to update your stored credentials.' | Write-Warning
        $PSCmdlet.WriteError($_)
    }

    if ($null -eq $BluebirdPSConfiguration.AuthUserId) {
        Set-BluebirdPSAuthUser
    }

    if ($null -eq $OAuth['BearerToken']) {
        'Bearer token not present in Twitter authentication data.','Attempting to retrieve current bearer token from Twitter.' | Write-Verbose
        Set-TwitterBearerToken
    }

    try {
        Invoke-TwitterVerifyCredentials -BearerToken | Out-Null
    }
    catch {
        'Authentication data appears to have an invalid bearer token.','Please use the Set-TwitterBearerToken command to update your stored bearer token.' | Write-Warning
        $PSCmdlet.WriteError($_)
    }

    Export-BluebirdPSConfiguration
}
