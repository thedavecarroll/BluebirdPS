---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Authentication/Export-TwitterAuthentication
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

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, the bearer token for OAuth 2.0.

This command will update the BluebirdPS configuration value AuthLastExportDate in the current session and Export-BluebirdPSConfiguration to save the configuration values.

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

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Authentication/Export-TwitterAuthentication)

[Import-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.0/Authentication/Import-TwitterAuthentication)

[Set-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.0/Authentication/Set-TwitterAuthentication)

[Test-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.0/Authentication/Test-TwitterAuthentication)

[Api Reference - Authentication Overview](https://developer.twitter.com/en/docs/authentication/overview)
