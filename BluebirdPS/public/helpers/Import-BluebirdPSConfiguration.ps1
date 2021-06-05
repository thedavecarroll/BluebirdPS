function Import-BluebirdPSConfiguration {
    [CmdletBinding()]
    param()

    $FileDescription = 'BluebirdPS configuration file'
    'Checking {0}.' -f $FileDescription | Write-Verbose

    if (Test-Path -Path $BluebirdPSConfiguration.ConfigurationPath) {

        '{0} found.' -f $FileDescription | Write-Verbose

        try {

            'Attempting to import {0}.' -f $FileDescription | Write-Verbose

            $ConfigFromDisk = Get-Content -Path $BluebirdPSConfiguration.ConfigurationPath | ConvertFrom-Json

            # ensure that the configuration file has the correct keys/attributes
            $ConfigObject = [Configuration]@{}

            foreach ($ConfigValue in $ConfigObject.psobject.Properties.Name) {
                if ($ConfigValue -eq 'AuthLastExportDate') {
                    if ($null -ne $ConfigFromDisk.AuthLastExportDate) {
                        $AuthLastExportDate = $ConfigFromDisk.AuthLastExportDate
                    } else {
                        if (Test-Path -Path $BluebirdPSConfiguration.CredentialsPath) {
                            $AuthLastExportDate = (Get-ChildItem -Path $BluebirdPSConfiguration.CredentialsPath).LastWriteTime
                        }
                    }
                    $BluebirdPSConfiguration.AuthLastExportDate = $AuthLastExportDate
                    continue
                }

                if ($null -ne $ConfigFromDisk.$ConfigValue) {
                    'Importing value {0} into {1}' -f $ConfigFromDisk.$ConfigValue,$ConfigValue | Write-Verbose
                    $BluebirdPSConfiguration.$ConfigValue = $ConfigFromDisk.$ConfigValue
                }

            }

            '{0} imported.' -f $FileDescription | Write-Verbose
        }
        catch {
            '{0} appears to be corrupted. Please run Export-BluebirdPSConfiguration to regenerate.' -f $FileDescription | Write-Warning
        }

    } else {
        '{0} not found. Please run Export-BluebirdPSConfiguration to regenerate.' -f $FileDescription | Write-Warning
    }
}
