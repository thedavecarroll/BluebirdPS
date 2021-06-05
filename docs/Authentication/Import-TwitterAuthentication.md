---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Authentication/Import-TwitterAuthentication
schema: 2.0.0
---

# Import-TwitterAuthentication

## SYNOPSIS

Import the current user's authentication credentials from an encrypted file.

## SYNTAX

```powershell
Import-TwitterAuthentication [<CommonParameters>]
```

## DESCRIPTION

Import the current user's authentication credentials from an encrypted file.

The encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth 2.0.

This essentially refreshes the session variable with the credentials from the encrypted file.

This command is called when the module is imported.

## EXAMPLES

### Example 1

```powershell
PS > Import-TwitterAuthentication
```

Import the current user's authentication credentials from an encrypted file.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.5.1/Authentication/Export-TwitterAuthentication)

[Set-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.5.1/Authentication/Set-TwitterAuthentication)

[Test-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.5.1/Authentication/Test-TwitterAuthentication)

[Api Reference - Authentication Overview](https://developer.twitter.com/en/docs/authentication/overview)
