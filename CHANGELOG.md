# Changelog

## 0.7.0 - 2021-06-26

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

## [0.6.2] - 2021-06-20

Bugfix and Feature; Update Strongly Recommended

### Fixed

- [Issue #73](https://github.com/thedavecarroll/BluebirdPS/issues/73) - LICENSE - Include license file with module
- [Issue #85](https://github.com/thedavecarroll/BluebirdPS/issues/85) - Invoke-TwitterRequest - Progress bar is displayed after the first page, even when there is no second page
- [Issue #87](https://github.com/thedavecarroll/BluebirdPS/issues/87) - Invoke-TwitterRequest - tweets/search/recent endpoint used multiple times, but command only checks for Search-Tweet

### Added

- [Issue #86](https://github.com/thedavecarroll/BluebirdPS/issues/86) - [BluebirdPS.ResponseData] - Add Timestamp property

## [0.6.1] - 2021-06-16

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

## [0.5.1] - 2021-06-05

Bugfix and Maintenance; Update Strongly Recommended

### Fixed

- [Issue #64](https://github.com/thedavecarroll/BluebirdPS/issues/64) - Remove unnecessary warning message from Import-BluebirdPSConfiguration
- [Issue #66](https://github.com/thedavecarroll/BluebirdPS/issues/66) - Get-TwitterList - Omission of UserName parameter generates incorrect query
- [Issue #68](https://github.com/thedavecarroll/BluebirdPS/issues/68) - Documentation - Publish-Tweet has typo in description
- [Issue #69](https://github.com/thedavecarroll/BluebirdPS/issues/69) - Set-TwitterAuthentication throws "Cannot find path" error when ~\.BluebirdPS\ does not exist

## [0.5.0] - 2021-06-02

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
- [Issue #61](https://github.com/thedavecarroll/BluebirdPS/issues/61) - Update module's prepend and append scripts

### Removed

- [Issue #51](https://github.com/thedavecarroll/BluebirdPS/issues/51) - Remove Endpoints JSON

### Maintenance

- [Issue #39](https://github.com/thedavecarroll/BluebirdPS/issues/39) - Maint move source files into api versioned folders
- [Issue #50](https://github.com/thedavecarroll/BluebirdPS/issues/50) - Move docs site to new domain
- [Issue #37](https://github.com/thedavecarroll/BluebirdPS/issues/37) - Build script does not work on MacOS or Raspbian

## [0.1.1] - 2020-11-23

Bugfix; Update Strongly Recommended

### Fixed

- [Issue #27](https://github.com/thedavecarroll/BluebirdPS/issues/27) - Errors on Import-Module
- [Issue #28](https://github.com/thedavecarroll/BluebirdPS/issues/28) - Add an About help topic

## [0.1.0] - 2020-11-22

Initial release

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

[0.1.0]: https://github.com/thedavecarroll/BluebirdPS/tree/27d2d3251bc76558d0b7b91a5db6b967da85b269
[0.1.1]: https://github.com/thedavecarroll/BluebirdPS/tree/962d11e2f6d3d6de68671fc495dd2693e717b4b8
[0.5.0]: https://github.com/thedavecarroll/BluebirdPS/tree/feab8637afcbdb58dd3b816796c145764be0c170
[0.5.1]: https://github.com/thedavecarroll/BluebirdPS/tree/51bbfffb87d0e8d6e2c846971f878644b9daf873
[0.6.1]: https://github.com/thedavecarroll/BluebirdPS/tree/12acb1ab9d988bd27c10ebdb37ad5b012cf5a4ab
[0.6.2]: https://github.com/thedavecarroll/BluebirdPS/tree/ba829bae4735df569e48f93bf32ea56252695783

## Keep a Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).
