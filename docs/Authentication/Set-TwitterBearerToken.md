---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Authentication/Set-TwitterBearerToken
schema: 2.0.0
---

# Set-TwitterBearerToken

## SYNOPSIS

The Set-TwitterBearerToken command receives and sets the user's OAuth 2.0 bearer token credential.

## SYNTAX

```powershell
Set-TwitterBearerToken [<CommonParameters>]
```

## DESCRIPTION

The Set-TwitterBearerToken command receives and sets the user's OAuth 2.0 bearer token credential.

The command sends the user's API key and API key secret to the Twitter and receives the bearer token which is saved in the session variable.

Additionally, it exports the updated session credential variable using Export-TwitterAuthentication.
The encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

## EXAMPLES

### Example 1

```powershell
PS > Set-TwitterBearerToken
```

Set the user's bearer token and save the session credentials in the folder $env:HOME/.BluebirdPS.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Authentication/Set-TwitterBearerToken)

[Import-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.6.2/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.6.2/Authentication/Export-TwitterAuthentication)

[Test-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.6.2/Authentication/Test-TwitterAuthentication)

[Api Reference - Authentication Overview](https://developer.twitter.com/en/docs/authentication/overview)
