
@{
  Author = 'Dave Carroll'
  FileList = @()
  Description = 'A Twitter Automation Client for PowerShell 7. Tweet, retweet, send direct messages, manage lists, and more.'
  RootModule = 'BluebirdPS.psm1'
  Copyright = '2020-2021'
  PrivateData = @{
    PSData = @{
      ReleaseNotes = '## 0.5.1 - 2021-06-05
      
      Bugfix and Maintenance; Update Strongly Recommended
      
      ### Fixed
      
      - [Issue #64](https://github.com/thedavecarroll/BluebirdPS/issues/64) - Remove unnecessary warning message from Import-BluebirdPSConfiguration
      - [Issue #66](https://github.com/thedavecarroll/BluebirdPS/issues/66) - Get-TwitterList - Omission of UserName parameter generates incorrect query
      - [Issue #68](https://github.com/thedavecarroll/BluebirdPS/issues/68) - Documentation - Publish-Tweet has typo in description
      - [Issue #69](https://github.com/thedavecarroll/BluebirdPS/issues/69) - Set-TwitterAuthentication throws "Cannot find path" error when ~\.BluebirdPS\ does not exist
      
      For full CHANGELOG, see https://docs.bluebirdps.dev/en/latest/CHANGELOG/
      '
      Tags = @('Twitter-Client','Twitter-API','Twitter','Tweet','Automation','Social-Media')
      LicenseUri = 'https://docs.bluebirdps.dev/en/latest/LICENSE/'
      ProjectUri = 'https://github.com/thedavecarroll/BluebirdPS'
    }
  }
  CmdletsToExport = @()
  CompatiblePSEditions = 'Core'
  ModuleVersion = '0.5.1'
  VariablesToExport = @()
  CompanyName = 'thedavecarroll'
  AliasesToExport = @()
  PowerShellVersion = '7.0'
  FunctionsToExport = @()
  GUID = 'b46904d8-98f5-430e-893a-5ad77ceed8bd'
}
