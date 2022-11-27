---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Import-TwitterAuthentication
schema: 2.0.0
---

# Import-TwitterAuthentication

## SYNOPSIS

Import the current user's authentication credentials from specific environment variables or an encrypted credentials file.

## SYNTAX

```powershell
Import-TwitterAuthentication [<CommonParameters>]
```

## DESCRIPTION

Import the current user's authentication credentials from specific environment variables or an encrypted credentials file.

The authentication data will be imported from specific environment variables in preference to data in the encrypted credentials file.

The following environment variables must be used to set the BluebirdPS authentication credentials.

BLUEBIRDPS_API_KEY, BLUEBIRDPS_API_SECRET, BLUEBIRDPS_ACCESS_TOKEN, BLUEBIRDPS_ACCESS_TOKEN_SECRET, BLUEBIRDPS_BEARER_TOKEN

If the required environment variables are not set, this command will attempt to import authentication data from the encrypted credentials file.

The encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth 2.0.

This essentially refreshes the session variable with the credentials from the encrypted file.

This command is called when the module is imported.

## EXAMPLES

### Example 1

```powershell
PS > Import-TwitterAuthentication
```

Import the current user's authentication credentials from specific environment variables or an encrypted credentials file.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Export-TwitterAuthentication)

[Set-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Set-TwitterAuthentication)

[Test-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Test-TwitterAuthentication)

[Api Reference - Authentication Overview](https://developer.twitter.com/en/docs/authentication/overview)
