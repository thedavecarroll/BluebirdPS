---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Authentication/Export-TwitterAuthentication
schema: 2.0.0
---

# Export-TwitterAuthentication

## SYNOPSIS

Export the current user's authentication credentials to an encrypted file.

## SYNTAX

```powershell
Export-TwitterAuthentication [<CommonParameters>]
```

## DESCRIPTION

Export the current user's authentication credentials to an encrypted file.

The encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth v2 endpoints.

## EXAMPLES

### Example 1

```powershell
PS > Export-TwitterAuthentication
```

Exports the sessions current credentials to an encrypted file.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Authentication/Export-TwitterAuthentication)

[Import-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Import-TwitterAuthentication)

[Set-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterAuthentication)

[Api Reference - Authentication](https://developer.twitter.com/en/docs/authentication/oauth-1-0a)
