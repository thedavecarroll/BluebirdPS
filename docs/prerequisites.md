# Pre-requisites

In order to use this module, you will need to have PowerShell 7 installed and a Twitter Developer account.

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
