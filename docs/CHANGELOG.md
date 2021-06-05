# Changelog

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
[0.5.1]: https://github.com/thedavecarroll/BluebirdPS/tree/feab8637afcbdb58dd3b816796c145764be0c170

## Keep a Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).
