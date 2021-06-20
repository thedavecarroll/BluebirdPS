
@{
  Copyright = '2020-2021'
  PowerShellVersion = '7.0'
  RootModule = 'BluebirdPS.psm1'
  CompanyName = 'thedavecarroll'
  ModuleVersion = '0.6.2'
  Author = 'Dave Carroll'
  CompatiblePSEditions = 'Core'
  FileList = @()
  PrivateData = @{
    PSData = @{
      Tags = @('Twitter-Client','Twitter-API','Twitter','Tweet','Automation','Social-Media')
      ReleaseNotes = '## 0.6.2 - 2021-06-20
      
      Bugfix and Feature; Update Strongly Recommended
      
      ### Fixed
      
      - [Issue #73](https://github.com/thedavecarroll/BluebirdPS/issues/73) - LICENSE - Include license file with module
      - [Issue #85](https://github.com/thedavecarroll/BluebirdPS/issues/85) - Invoke-TwitterRequest - Progress bar is displayed after the first page, even when there is no second page
      - [Issue #87](https://github.com/thedavecarroll/BluebirdPS/issues/87) - Invoke-TwitterRequest - tweets/search/recent endpoint used multiple times, but command only checks for Search-Tweet
      
      ### Added
      
      - [Issue #86](https://github.com/thedavecarroll/BluebirdPS/issues/86) - [BluebirdPS.ResponseData] - Add Timestamp property
      
      For full CHANGELOG, see https://docs.bluebirdps.dev/en/latest/CHANGELOG/
      '
      LicenseUri = 'https://docs.bluebirdps.dev/en/latest/LICENSE/'
      ProjectUri = 'https://github.com/thedavecarroll/BluebirdPS'
    }
  }
  CmdletsToExport = @()
  VariablesToExport = @()
  Description = 'A Twitter Automation Client for PowerShell 7. Tweet, retweet, send direct messages, manage lists, and more.'
  FunctionsToExport = @()
  AliasesToExport = @()
  GUID = 'b46904d8-98f5-430e-893a-5ad77ceed8bd'
}
