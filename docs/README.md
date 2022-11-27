# BluebirdPS: A Twitter Automation Client for PowerShell 7

<img align="left" src="images/bluebirdps-logo.jpg" alt="BluebirdPS" height="120" width="120"/>
Welcome to the online documentation for BluebirdPS, a Twitter automation client for PowerShell 7.

![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/bluebirdps?label=PowerShell%20Gallery%20Downloads&logo=PowerShell&style=for-the-badge)
![PowerShell Gallery Version (including pre-releases)](https://img.shields.io/powershellgallery/v/bluebirdps?color=blue&include_prereleases&label=PowerShell%20Gallery&logo=PowerShell&style=for-the-badge)

[![Standard](https://img.shields.io/endpoint?url=https%3A%2F%2Ftwbadges.glitch.me%2Fbadges%2Fstandard)](https://developer.twitter.com/en/docs/twitter-api)
[![v2](https://img.shields.io/endpoint?url=https%3A%2F%2Ftwbadges.glitch.me%2Fbadges%2Fv2)](https://developer.twitter.com/en/docs/twitter-api)

## Work in Progress

Please consider this a work in progress.
At this point, anything and everything could be changed.

Also, expect errors, though I have tried to keep those at minimum.

## Community Project

This project is very much developed for the community and will gladly accept feedback from the
community to make this module do what you need it to do, while adhering to the Twitter API design and
PowerShell best practices.

## What's New

The v0.8.2 release of BluebirdPS includes the following:

- **Fixes Find-TwitterMastodonLinks erroneous matching criteria.**

- Adds new RateLimitAction item Resume that allows Invoke-TwitterRequest to resume after rate limit is reached.
- Adds capability to set RateLimitAction via environment values.
- Adds $BluebirdPSLastResponse session variable.

The v0.8.1 release of BluebirdPS includes the following:

- **Fixes Publish-Tweet fails to render response**

The v0.8.0 release of BluebirdPS includes the following:

- **Converts List commands to Twitter API v2 endpoints.**
- **Converts Muted User commands to Twitter API v2 endpoints.**
- **Adds commands for Pinned List endpoints.**
- **Adds Edit Controls and Edit History to Tweet object classes.**
- **Fixes Media class to include Url and AltText properties.**

- Removes `GetOriginalObject()` from Context and BaseMetrics.
- Adds OutputType to most commands.
- Add Metrics exception class.
- Add `Get-BluebirdPSVersion` to display the imported version of BluebirdPS.
- Add `Get-BluebirdPSAssemblyDetails` to assist with class discovery.
- Add `Show-TwitterAuthentication` to assist with authentication validation.

The v0.7.0 release of BluebirdPS includes the following:

- **Adds new command, `Get-TweetCount`, which corresponds to the recently released `GET /tweets/count/recent` endpoint.**
- **Removes configuration value for `RawOutput`. This capability is replaced by new configuration value `OutputType`.**

- Fixes parameter sets for `Publish-TwitterDM` and parameter validation for several commands.
- Fixes `Get-TwitterApiEndpoint` filter for `CommandName`.
- `Publish-TwitterDM` now allows users to send a message only, message and media, or media only.
- Adds `ToString()` override for Tweet and User object classes.
- Adds new configuration value `OutputType` with values of 'CustomClasses', 'PSCustomObject', or 'JSON'. This will allow a user to specify the format for API output.

The v0.6.2 release of BluebirdPS includes the following:

- Fixes pagination for /2/tweets/search/recent endpoint and display of progress bar
- Adds Timestamp property to ResponseData

The v0.6.1 release of BluebirdPS adds the following new features.

- Import-TwitterAuthentication will attempt to import authentication data from environment variables first before importing from the encrypted credentials file.
- Invoke-TwitterRequest progress bar for paged requests
- Added InvocationInfo to ResponseData and TotalVotes to Poll classes.

The v0.5.0 release of BluebirdPS packs a lot of new features and breaking changes from the previous release.

- Support for Twitter API v2: Early Access
- Complete management for:
  - Saved searches
  - List, list membership, and list subscriptions
  - User friends (following) and followers
  - User blocks, mutes, and spam reporting
  - Tweet retweets, likes, and hiding individual replies
- A new configuration framework
- An updated command session history
- C# classes for most API responses, and for request generation and authentication
- Parameter consistency has been enforced, for example all references to the UserName instead of ScreenName and Id for the numerical identifier regardless of object type.
- Nearly 20 more commands than the previous release.

## Examples

```PowerShell
Search-Tweet -SearchString "(from:thedavecarroll)"

Get-Tweet -Id 1398279333823791104

Publish-Tweet -TweetText "A new release of #BluebirdPS will soon be released. BluebirdPS is #PowerShell 7 Twitter automation client. Check it out! https://bit.ly/BluebirdPS"

Get-TwitterList -Id 1397040831777984512 | Add-TwitterListMember -UserName thedavecarroll,BluebirdPS
```

## BluebirdPS Technical Overview

BluebirdPS was written to provide simple commands to work with the Twitter API while adhering to PowerShell best practices.
It largely obfuscates the endpoints from the user, though they certainly can take a peek under the hood with a few commands.

A framework consisting of configuration, request, authentication, and output objects allows commands to be easily crafted and updated.

### Configuration

BluebirdPS configuration is created on module import, and updated through setting authentication or manual changes.
It is exported to disk and imported on all future module imports.

The configuration provides instructions to commands on how to handle rate limits and whether the raw API response should be returned.
It stores the authenticating user's Id and username which are required by some endpoints.
Additionally, it contains the save locations for the configuration and credential files, as well as the last time authentication was verified and exported.

### Building a Twitter Request

A Twitter API request has many parameters: the HTTP method/verb, the endpoint, a query, the authentication type, and potentially, body or form data.
BluebirdPS collects the values for all of these parameters into a `[BluebirdPS.TwitterRequest]` class object and sends this to the `Invoke-TwitterRequest` command.

### Authentication

Connections to the Twitter API require authentication, which is provided by the `[BluebirdPS.Authentication]` class object.
Depending on the endpoint, the request may require *OAuth 1.0a*, *OAuth2 Bearer Token*, or *Basic* authentication.
The request object contains the authentication type required for the particular endpoint.
When the authentication object is created, the request and appropriate credentials for the authentication type are used.
The authentication object is used to generate the authentication header, final URL, and HTTP method.

### Sending the Twitter Request

`Invoke-TwitterRequest` uses the authentication and request objects to generate the web request.
It then uses the PowerShell command `Invoke-RestMethod` to make the API call.
The returned response, including response headers, the status code, and the request and authentication objects are used to created a new `[BluebirdPS.ResponseData]` class object.

### Response Data, History, Output Streams, and Exceptions

The response data object is sent to the `Write-TwitterResponse` command.
This command performs the rate limit action when the threshold is reached, both based on configuration values.

Next, the command adds the response data to the module's session history list, writes the same data to the *Information Stream*,
and stores the last response in the session variable `$BluebirdPSLastResponse`.

With possible values of 'CustomClasses', 'PsCustomObject', or 'JSON', the configuration value for OutputType determines the format that the API response will be presented to the user.

If errors are returned and the OutputType is 'CustomClasses', they are parsed and specific exceptions are thrown.
Otherwise, the errors are included in the output.

### Rich Objects, C# Classes

The object model from both API versions was used as the basis for creating new C# classes.
All BluebirdPS classes use `PascalCase`, instead of `snake_case` which the API returns.
Most classes include a `GetOriginalObject()` method which returns the original object received.

### Pagination

The `Invoke-TwitterRequest` command handles pagination for API v2 endpoints, and for API v1.1 endpoints that support the `cursor`/`next_cursor` pattern.

## Command Verbs

The following table defines the command verbs that will be used by commands in this module.

| Verb        | Usage                            | Example                                                                                           |
| ----------- | -------------------------------- | ------------------------------------------------------------------------------------------------- |
| Get         | Get a resource                   | `Get-TwitterUser`                                                                                 |
| Set         | Like, unlike, update, and others | `Set-Tweet -Id 12345567896321478 -Like`                                                           |
| Add         | Adding a new resource            | `Add-TwitterList -Name 'MyListName' -Description 'A cool description' -Mode Private`              |
| Remove      | Removing a resource              | `Remove-TwitterList -Id 1399719470894100485`                                                      |
| Search      | Text search for a user or Tweet  | `Search-Tweet -SearchString '#PSTweetChat'`                                                       |
| Publish     | Tweet or Direct Message          | `Publish-Tweet -TweetText 'Check out this pic of #Snoopy' -MediaId $UploadedPic.media_id`         |
| Unpublish   | Delete Tweet or Direct Message   | `Unpublish-Tweet -Id 1399711831015428097`                                                         |
| Send        | Send media                       | `Send-TwitterMedia -Path $PathToImage -Category TweetImage -AltImageText 'A bowl of froot loops'` |
| Submit      | Submit a user as spam            | `Submit-TwitterUserAsSpam -User ASpammyAccount`                                                   |
| Export      | Export config or credentials     | `Export-BluebirdPSConfiguration`                                                                  |
| Import      | Import config or credentials     | `Import-TwitterAuthentication`                                                                    |
| Test        | Test credentials and others      | `Test-TwitterAuthentication`                                                                      |
| ConvertFrom | Convert from other time formats  | `ConvertFrom-EpochTime -UnixTime 1622554869`                                                      |
| Invoke      | Acts on the Twitter API          | `Invoke-TwitterRequest -RequestParameters $Request`                                               |

## Things to Do

- Rate limit based waiting period per endpoint
  - Once a rate limit has been reached for a given endpoint, validate current time against rate limit reset time before making the call.
  - Configuration value to enable/disable.
- Expand build scripts
- Pester tests
- TweetText processor (currently there no check for length)
- Exploration of PIN-OAuth
