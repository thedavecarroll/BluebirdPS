# Pre-requisites

In order to use this module, you will need to have PowerShell 7 installed and a Twitter Developer account.

## PowerShell 7

In order to support cross-platform scenarios, PowerShell 7 was chosen as the version for this new module.
Focusing on a single version will also allow us to forego handling the API calls differently between Windows PowerShell and PowerShell 7.

Please see [Installing various versions of PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7) for instructions on installing PowerShell 7.
You can install it on virtually any modern operating system - Windows, MacOS, or Linux.

## Developer Account Tokens

Currently, any user of the module would need to [apply for a Twitter Developer account](https://developer.twitter.com/en/apply/user.html) and create an application in the portal.

1. Once you have created the application, generate your API key/secret and access token/secret.
2. Next, clone this repo to a location of your choosing. This will change once the module is in the PowerShell Gallery.
3. Then use the `Set-TwitterAuthentication -Persist` to add your key, token and secrets. (Omit the `-Persist` if you do not want to save your credentials to disk.)

```powershell
Set-TwitterAuthentication -Persist -Verbose
```

```console
API Key: *************************
API Secret: **************************************************
Access Token: **************************************************
Access Token Secret: *********************************************

<truncated>

VERBOSE: Successfully connected to Twitter.
VERBOSE: Saved Twitter credentials to existing file: C:\Users\Dave\.TwitterPowerShell\twittercred.sav
```
