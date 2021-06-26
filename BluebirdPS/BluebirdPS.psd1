
@{
  Copyright = '2020-2021'
  PowerShellVersion = '7.0'
  RootModule = 'BluebirdPS.psm1'
  CompanyName = 'thedavecarroll'
  ModuleVersion = '0.7.0'
  Author = 'Dave Carroll'
  CompatiblePSEditions = 'Core'
  FileList = @()
  PrivateData = @{
    PSData = @{
      Tags = @('Twitter-Client','Twitter-API','Twitter','Tweet','Automation','Social-Media')
      ReleaseNotes = '## 0.7.0 - 2021-06-26

      Bugfix and Feature; Update Strongly Recommended

      ### Fixed

      - [Issue #89](https://github.com/thedavecarroll/BluebirdPS/issues/89) - Publish-TwitterDM - Parameter sets not functioning correctly
      - [Issue #94](https://github.com/thedavecarroll/BluebirdPS/issues/94) - Get-TwitterListMember, and other functions - Does not check if List parameter is an empty object
      - [Issue #95](https://github.com/thedavecarroll/BluebirdPS/issues/95) - Get-TwitterApiEndpoint - Parameter CommandName does not filter correctly
      - [Issue #96](https://github.com/thedavecarroll/BluebirdPS/issues/96) - Write-TwitterResponse - ErrorRecord should only be generated when API errors are returned and OutputType is CustomClasses

      ### Changed

      - [Issue #98](https://github.com/thedavecarroll/BluebirdPS/issues/98) - BluebirdPSConfiguration.RawOutput - Remove this configuration value

      ### Added

      - [Issue #72](https://github.com/thedavecarroll/BluebirdPS/issues/72) - [New Feature] BluebirdPS.APIV2.TweetInfo.Tweet should override .ToString()
      - [Issue #90](https://github.com/thedavecarroll/BluebirdPS/issues/90) - Publish-TwitterDM - Allow users to send message only, message and media, or media only direct messages
      - [Issue #91](https://github.com/thedavecarroll/BluebirdPS/issues/91) - Get-TweetCount - Add new function recent Tweet counts endpoint
      - [Issue #92](https://github.com/thedavecarroll/BluebirdPS/issues/92) - BluebirdPS.APIV2.UserInfo.User - Override ToString()
      - [Issue #93](https://github.com/thedavecarroll/BluebirdPS/issues/93) - Get-TwitterList - Accept list full name as another parameter set
      - [Issue #97](https://github.com/thedavecarroll/BluebirdPS/issues/97) - BluebirdPSConfiguration.OutputType - Add new configuration value to set the output type

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
