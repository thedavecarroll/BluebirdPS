@{
    RootModule = 'BluebirdPS.psm1'
    ModuleVersion = '0.5.1'
    CompatiblePSEditions = 'Core'
    GUID = 'b46904d8-98f5-430e-893a-5ad77ceed8bd'
    Author = 'Dave Carroll'
    CompanyName = 'thedavecarroll'
    Copyright = '2020-2021'
    Description = 'A Twitter Automation Client for PowerShell 7. Tweet, retweet, send direct messages, manage lists, and more.'
    PowerShellVersion = '7.0'
    #NestedModules = 'bin\BluebirdPS.dll'
    FunctionsToExport = @()
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    FileList = @()
    # PowerShellHostName = ''
    # PowerShellHostVersion = ''
    # DotNetFrameworkVersion = ''
    # ClrVersion = ''
    # ProcessorArchitecture = ''
    # RequiredModules = @()
    # RequiredAssemblies = @()
    # ScriptsToProcess = @()
    # TypesToProcess = @()
    # FormatsToProcess = @()
    # NestedModules = @()
    # DscResourcesToExport = @()
    # ModuleList = @()
    PrivateData = @{
        PSData = @{
            Tags = 'Twitter-Client','Twitter-API','Twitter','Tweet','Automation','Social-Media'
            ReleaseNotes = '## 0.5.0 - 2021-06-02

Feature, Bugfix, and Maintenance; Update Strongly Recommended

### Deprecated

- [Issue #43](https://github.com/thedavecarroll/BluebirdPS/issues/43) - Remove Functions for Migrated Endpoints
- [Issue #54](https://github.com/thedavecarroll/BluebirdPS/issues/54) - Remove Unused or Replaced Functions

### Fixed

- [Issue #29](https://github.com/thedavecarroll/BluebirdPS/issues/29) - [BUG] Get-TwitterDM is not allowed
- [Issue #30](https://github.com/thedavecarroll/BluebirdPS/issues/30) - [New Feature] All commands using parameter sets needs default parameter set in cmdletbinding
- [Issue #42](https://github.com/thedavecarroll/BluebirdPS/issues/42) - Suppress Duplicate ChangeLog Entries
- [Issue #36](https://github.com/thedavecarroll/BluebirdPS/issues/36) - Add CodeAnalysis.SuppressMessage as Required
- [Issue #35](https://github.com/thedavecarroll/BluebirdPS/issues/35) - Expand Build Scripts
- [Issue #34](https://github.com/thedavecarroll/BluebirdPS/issues/34) - Remove ValueFromPipeline from Private Functions

### Added

- [Issue #40](https://github.com/thedavecarroll/BluebirdPS/issues/40) - Add C# Enums as required
- [Issue #41](https://github.com/thedavecarroll/BluebirdPS/issues/41) - Add C# Classes for Output and Processing
- [Issue #38](https://github.com/thedavecarroll/BluebirdPS/issues/38) - Add OAuthVersion to Endpoint JSON
- [Issue #52](https://github.com/thedavecarroll/BluebirdPS/issues/52) - Add Commands for API v2 Endpoints
- [Issue #55](https://github.com/thedavecarroll/BluebirdPS/issues/55) - Add Commands for v1.1 Endpoints
- [Issue #56](https://github.com/thedavecarroll/BluebirdPS/issues/56) - Create private functions as required
- [Issue #57](https://github.com/thedavecarroll/BluebirdPS/issues/57) - Create functions to support new configuration, history, and api endpoint search
- [Issue #32](https://github.com/thedavecarroll/BluebirdPS/issues/32) - Convert-TweetDate
- [Issue #53](https://github.com/thedavecarroll/BluebirdPS/issues/53) - Update Functions to Use New Classes
- [Issue #58](https://github.com/thedavecarroll/BluebirdPS/issues/58) - Update authentication functions to integrate configuration framework
- [Issue #59](https://github.com/thedavecarroll/BluebirdPS/issues/59) - Update Invoke-TwitterRequest for new classes and configuration, and make public
- [Issue #60](https://github.com/thedavecarroll/BluebirdPS/issues/60) - Cleanup remaining outstanding commands
- [Issue #61](https://github.com/thedavecarroll/BluebirdPS/issues/61) - Update module''s prepend and append scripts

### Removed

- [Issue #51](https://github.com/thedavecarroll/BluebirdPS/issues/51) - Remove Endpoints JSON

### Maintenance

- [Issue #39](https://github.com/thedavecarroll/BluebirdPS/issues/39) - Maint move source files into api versioned folders
- [Issue #50](https://github.com/thedavecarroll/BluebirdPS/issues/50) - Move docs site to new domain
- [Issue #37](https://github.com/thedavecarroll/BluebirdPS/issues/37) - Build script does not work on MacOS or Raspbian

For full CHANGELOG, see https://docs.bluebirdps.dev/en/latest/CHANGELOG/
'
        }
    }
    # HelpInfoURI = ''
}