# BluebirdPS: A Twitter Automation Client for PowerShell 7

![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/bluebirdps?label=PowerShell%20Gallery%20Downloads&logo=PowerShell&style=for-the-badge)
![PowerShell Gallery Version (including pre-releases)](https://img.shields.io/powershellgallery/v/bluebirdps?color=blue&include_prereleases&label=PowerShell%20Gallery&logo=PowerShell&style=for-the-badge)

[![Standard](https://img.shields.io/endpoint?url=https%3A%2F%2Ftwbadges.glitch.me%2Fbadges%2Fstandard)](https://developer.twitter.com/en/docs/twitter-api)
[![v2](https://img.shields.io/endpoint?url=https%3A%2F%2Ftwbadges.glitch.me%2Fbadges%2Fv2)](https://developer.twitter.com/en/docs/twitter-api)

This is the project repo for BluebirdPS, a Twitter automation client for PowerShell 7.

## Work in Progress

Please consider this a work in progress.
At this point, anything and everything could be changed.

Though I have tried to keep errors at minimum, the user may encounter some.
Please report any bugs in the [BluebirdPS repo](https://bit.ly/BluebirdPSBugReport).

## Community Module

This module is still very much developed for the community and will gladly accept feedback from the
community to make this module do what you need it to do, while adhering to the Twitter API design and
PowerShell best practices.

## Pre-requisites

In order to use this module, you will need to have PowerShell 7 installed and a Twitter Developer account and a Twitter Project/App created and request to API v2 Early Access.

## PowerShell 7

In order to support cross-platform scenarios, PowerShell 7 was chosen as the version for this new module.
Focusing on a single version will also allow us to forego handling the API calls differently between Windows PowerShell and PowerShell 7.

Please see [Installing various versions of PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7) for instructions on installing PowerShell 7.
You can install it on virtually any modern operating system - Windows, MacOS, or Linux.

## Developer Account, Project, App, and Access Tokens

In order to use BluebirdPS, or any other Twitter API client or library, you will need to go through several steps to gain access to the API.

### Applying for a Developer Account

You must apply for a developer account at https://developer.twitter.com/en/apply-for-access.
This process could take a couple weeks.

### Activate Developer Portal

Next, activate your developer portal at https://developer.twitter.com/content/developer-twitter/en/portal/opt-in.

### Create a Project and Register a Developer App

You must have a project with a developer app created in the portal.

### Apply for Access for the Twitter API v2: Early Access

Visit the [Twitter API Getting Started](https://developer.twitter.com/en/docs/twitter-api/getting-started/about-twitter-api) page for details and additional links.

### Generate Account Tokens

From the portal, you will need to generate the consumer key, otherwise called the API Key and Secret.
The API Key is linked to your application.

You will also need to generate an Access Token and Secret.
The Access Token is linked to your Twitter user account.

The application must be given access permissions of Read, Write, and Direct Message for full usage.
At minimum, the application needs Read access for any Get- commands.
Set-, Send-, and Publish-Tweet require Write access, while *-TwitterDM requires Direct Message access.

You can also generate a Bearer Token through the portal, or simply use the Set-TwitterAuthentication command.
If your credentials are validated, the bearer token will be requested and set in the authentication file, as well.

```powershell
Set-TwitterAuthentication
```

```console
API Key: *************************
API Secret: **************************************************
Access Token: **************************************************
Access Token Secret: *********************************************
```

## How to Install

### From the PowerShell Gallery

Start PowerShell 7 and run the following command:

```powershell
Install-Module -Name BluebirdPS -Scope CurrentUser
```

For more information, please visit the [BluebirdPS page] on the Powershell Gallery.

[BluebirdPS page]: https://bit.ly/BluebirdPS

### From the GitHub Release Page

1. Click [here] to go to the latest releases, then download the BluebirdPS.zip file attached to the release.
2. Right-click the downloaded zip, select Properties, then unblock the file.
  *This is to prevent having to unblock each file individually after unzipping.*
3. Unzip the archive.
4. *(Optional)* Place the module somewhere in your PSModulePath.
    * You can view the paths listed by running the environment variable `$env:PSModulePath`

[here]: https://github.com/thedavecarroll/BluebirdPS/tags

### Building from the GitHub Repo

1. Clone repo to a folder of your choice.
2. Change into the local repo folder.
3. Run the `build.ps1` script.
4. `Import-Module -Path .\BuildOutput\BluebirdPS\<module version>\BluebirdPS.psd1`

## Examples

```PowerShell
Search-Tweet -SearchString "(from:thedavecarroll)"

Get-Tweet -Id 1398279333823791104

Publish-Tweet -TweetText "A new release of #BluebirdPS will soon be released. BluebirdPS is #PowerShell 7 Twitter automation client. Check it out! https://bit.ly/BluebirdPS"

Get-TwitterList -Id 1397040831777984512 | Add-TwitterListMember -UserName thedavecarroll,BluebirdPS
```

## Things to Do

* Rate limit based waiting period per endpoint
  * Once a rate limit has been reached for a given endpoint, validate current time against rate limit reset time before making the call.
  * Configuration value to enable/disable.
* Expand build scripts
* Pester tests
* TweetText processor (currently there no check for length)
* Exploration of PIN-OAuth
