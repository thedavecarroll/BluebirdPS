
@{
  Copyright = '2020-2022'
  PowerShellVersion = '7.0'
  RootModule = 'BluebirdPS.psm1'
  CompanyName = 'thedavecarroll'
  ModuleVersion = '0.8.2'
  Author = 'Dave Carroll'
  CompatiblePSEditions = 'Core'
  FileList = @()
  PrivateData = @{
    PSData = @{
      Tags = @('Twitter-Client','Twitter-API','Twitter-API-V2','Twitter','Tweet','Automation','Social-Media')
      ReleaseNotes = '
      ## 0.8.1 - 2022-11-18

      Bugfix; Update Strongly Recommended

      ### Fixed

      - [Issue #174](https://github.com/thedavecarroll/BluebirdPS/issues/174) - Publish-Tweet - Fails to render API response

      ## 0.8.0 - 2022-11-13

      Bugfix, Feature, and Maintenance; Update Strongly Recommended

      ### Removed

      - [Issue #146](https://github.com/thedavecarroll/BluebirdPS/issues/146) - Remove Base Class of TwitterObject from Context and BaseMetrics
      - [Issue #170](https://github.com/thedavecarroll/BluebirdPS/issues/170) - Remove ListId Alist from List Commands

      ### Fixed

      - [Issue #101](https://github.com/thedavecarroll/BluebirdPS/issues/101) - Search-Tweet - MaxResults not honored
      - [Issue #105](https://github.com/thedavecarroll/BluebirdPS/issues/105) - Documentation - Update documentation for commands using /2/tweets/search/recent endpoint
      - [Issue #110](https://github.com/thedavecarroll/BluebirdPS/issues/110) - Publish-Tweet - Cannot index into a null array
      - [Issue #121](https://github.com/thedavecarroll/BluebirdPS/issues/121) - Media class is missing Url and AltText properties
      - [Issue #153](https://github.com/thedavecarroll/BluebirdPS/issues/153) - Various error handling
      - [Issue #154](https://github.com/thedavecarroll/BluebirdPS/issues/154) - Cleanup Tweet Class
      - [Issue #159](https://github.com/thedavecarroll/BluebirdPS/issues/159) - Tweet Metrics UrlLinkClicks Only Available for Tweets with Links
      - [Issue #167](https://github.com/thedavecarroll/BluebirdPS/issues/167) - BaseEntity GetEntities() Does Not Instantiate Annotations, CashTags, HashTags, and Mentions Correcly

      ### Changed

      - [Issue #129](https://github.com/thedavecarroll/BluebirdPS/issues/129) - Convert List Commands to Twitter API v2 Endpoints
      - [Issue #135](https://github.com/thedavecarroll/BluebirdPS/issues/135) - Convert Muted User Commands to Twitter API v2 Endpoints
      - [Issue #145](https://github.com/thedavecarroll/BluebirdPS/issues/145) - Get-TwitterUser: Change to auth user only endpoint

      ### Added

      - [Issue #102](https://github.com/thedavecarroll/BluebirdPS/issues/102) - Add NoPagination Switch to Invoke-TwitterRequest
      - [Issue #103](https://github.com/thedavecarroll/BluebirdPS/issues/103) - Add Verbose switch to Invoke-TwitterRequest
      - [Issue #127](https://github.com/thedavecarroll/BluebirdPS/issues/127) - Provide Classes and Updates to Enable API v2 Lists Endpoints
      - [Issue #130](https://github.com/thedavecarroll/BluebirdPS/issues/130) - Add OutputType to Commands
      - [Issue #132](https://github.com/thedavecarroll/BluebirdPS/issues/132) - Add Commands for Pinned List Endpoints
      - [Issue #140](https://github.com/thedavecarroll/BluebirdPS/issues/140) - Add new command Show-TwitterAuthentication
      - [Issue #141](https://github.com/thedavecarroll/BluebirdPS/issues/141) - Add new command Get-BluebirdPSAssemblyDetails
      - [Issue #144](https://github.com/thedavecarroll/BluebirdPS/issues/144) - Get-BluebirdPSVersion - Add new command to display version of BluebirdPS
      - [Issue #147](https://github.com/thedavecarroll/BluebirdPS/issues/147) - Add ToString() Override for Context and WithheldContent Classes
      - [Issue #148](https://github.com/thedavecarroll/BluebirdPS/issues/148) - Add Support for Edit Controls and Edit History
      - [Issue #150](https://github.com/thedavecarroll/BluebirdPS/issues/150) - Add New Metrics Exception
      - [Issue #156](https://github.com/thedavecarroll/BluebirdPS/issues/156) - Add Authenticated User to ResponseData
      - [Issue #165](https://github.com/thedavecarroll/BluebirdPS/issues/165) - Add Functionality to Parse User and Pinned Tweets to Find Mastodon Account References

      ### Maintenance

      - [Issue #124](https://github.com/thedavecarroll/BluebirdPS/issues/124) - C# Folder Structure - Ensure best practices for C# project older structure
      - [Issue #136](https://github.com/thedavecarroll/BluebirdPS/issues/136) - C# Additional Code Cleanup
      - [Issue #163](https://github.com/thedavecarroll/BluebirdPS/issues/163) - Update documentation

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
