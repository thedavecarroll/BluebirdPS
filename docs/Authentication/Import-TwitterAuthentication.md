---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Authentication/Import-TwitterAuthentication
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

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth v2 endpoints.

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

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Export-TwitterAuthentication)

[Set-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterAuthentication)

[Api Reference - Authentication](https://developer.twitter.com/en/docs/authentication/oauth-1-0a)