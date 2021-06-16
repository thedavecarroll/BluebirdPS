
@{
  Author = 'Dave Carroll'
  FileList = @()
  Description = 'A Twitter Automation Client for PowerShell 7. Tweet, retweet, send direct messages, manage lists, and more.'
  RootModule = 'BluebirdPS.psm1'
  Copyright = '2020-2021'
  PrivateData = @{
    PSData = @{
      ReleaseNotes = '## 0.5.2 - 2021-06-16

      Bugfix, Feature, and Maintenance; Update Strongly Recommended

      ### Fixed

      - [Issue #71](https://github.com/thedavecarroll/BluebirdPS/issues/71) - Documentation - Get-TwitterSavedSearch - API reference link incorrect for saved_searches/show/:id
      - [Issue #75](https://github.com/thedavecarroll/BluebirdPS/issues/75) - Import-TwitterAuthentication - Import from previous version throws error
      - [Issue #77](https://github.com/thedavecarroll/BluebirdPS/issues/77) - Invoke-TwitterRequest - Stagger API request submissions
      - [Issue #80](https://github.com/thedavecarroll/BluebirdPS/issues/80) - Uri for License and Project missing in PSGallery package

      ### Changed

      - [Issue #79](https://github.com/thedavecarroll/BluebirdPS/issues/79) - Get-TwitterApiEndpoint - Store endpoint data in a module variable

      ### Added

      - [Issue #74](https://github.com/thedavecarroll/BluebirdPS/issues/74) - Import-TwitterAuthentication - Use environment  variables to set authentication values
      - [Issue #76](https://github.com/thedavecarroll/BluebirdPS/issues/76) - Invoke-TwitterRequest - Add option for progress bar for paged requests
      - [Issue #81](https://github.com/thedavecarroll/BluebirdPS/issues/81) - [BluebirdPS.ResponseData] - Add InvocationInfo to history
      - [Issue #82](https://github.com/thedavecarroll/BluebirdPS/issues/82) - [BluebirdPS.APIV2.Objects.Poll] - Add TotalVotes property
      - [Issue #73](https://github.com/thedavecarroll/BluebirdPS/issues/73) - LICENSE - Include license file with module

      For full CHANGELOG, see https://docs.bluebirdps.dev/en/latest/CHANGELOG/'
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
