@{
    RootModule = 'BluebirdPS.psm1'
    ModuleVersion = '0.1.0'
    CompatiblePSEditions = 'Core'
    GUID = 'b46904d8-98f5-430e-893a-5ad77ceed8bd'
    Author = 'Dave Carroll'
    CompanyName = 'thedavecarroll'
    Copyright = '2020'
    Description = 'Tweet, retweet, send direct messages, manage lists, and more.'
    PowerShellVersion = '7.0'
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
            Tags = 'TwitterClient','Twitter','REST API','Social Media'
            ReleaseNotes = '## 0.1.0 - 2020-11-22

Feature; Update Strongly Recommended

### Fixed

- [Issue #13](https://github.com/thedavecarroll/BluebirdPS/issues/13) - Update Unpublish-TwitterDM to send actual message id
- [Issue #4](https://github.com/thedavecarroll/BluebirdPS/issues/4) - Create functions to handle authentication

### Maintenance

- [Issue #15](https://github.com/thedavecarroll/BluebirdPS/issues/15) - Update Get-TwitterList
- [Issue #11](https://github.com/thedavecarroll/BluebirdPS/issues/11) - Create function to verify Twitter credentials
- [Issue #12](https://github.com/thedavecarroll/BluebirdPS/issues/12) - Create Get-TwitterDM
- [Issue #14](https://github.com/thedavecarroll/BluebirdPS/issues/14) - Add Get-TwitterListMember
- [Issue #16](https://github.com/thedavecarroll/BluebirdPS/issues/16) - Create Get-TwitterListTweets
- [Issue #17](https://github.com/thedavecarroll/BluebirdPS/issues/17) - Create Get-TwitterListSubscriber
- [Issue #18](https://github.com/thedavecarroll/BluebirdPS/issues/18) - Create Get-TwitterListSubscription
- [Issue #19](https://github.com/thedavecarroll/BluebirdPS/issues/19) - Create Remove-TwitterSavedSearch
- [Issue #20](https://github.com/thedavecarroll/BluebirdPS/issues/20) - Create Add-TwitterSavedSearch
- [Issue #5](https://github.com/thedavecarroll/BluebirdPS/issues/5) - Add function to generate queries
- [Issue #7](https://github.com/thedavecarroll/BluebirdPS/issues/7) - Add module scaffolding and build script
- [Issue #8](https://github.com/thedavecarroll/BluebirdPS/issues/8) - Add ReturnValue parameter to Invoke-TwitterCursorRequest
- [Issue #3](https://github.com/thedavecarroll/BluebirdPS/pull/3) - Add example and pre-reqs

For full CHANGELOG, see https://bluebirdps.anovelidea.org/en/latest/CHANGELOG/
'
        }
    }
    # HelpInfoURI = ''
}