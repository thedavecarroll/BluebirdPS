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
                        'Importing value {0} into {1}' -f $AuthLastExportDate,$ConfigValue | Write-Verbose
                    } else {
                        if (Test-Path -Path $BluebirdPSConfiguration.CredentialsPath) {
                            $AuthLastExportDate = (Get-ChildItem -Path $BluebirdPSConfiguration.CredentialsPath).LastWriteTime
                            'Discovered value {0} from LastWriteTime for {1}' -f $AuthLastExportDate,$ConfigValue | Write-Verbose
                        }
                    }
                    $BluebirdPSConfiguration.AuthLastExportDate = $AuthLastExportDate
                    continue
                }

                # Deprecated configuration properties that were not moved to BluebirdPS Profile
                if ($ConfigValue -in 'RawOutput') {
                    'Configuration property {0} has been removed. Please see documentation for further details.' -f $ConfigValue | Write-Warning
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

    }
}
