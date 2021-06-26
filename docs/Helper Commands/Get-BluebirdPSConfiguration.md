---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Helper%20Commands/Get-BluebirdPSConfiguration
schema: 2.0.0
---

# Get-BluebirdPSConfiguration

## SYNOPSIS

Display the BluebirdPS configuration.

## SYNTAX

```powershell
Get-BluebirdPSConfiguration [<CommonParameters>]
```

## DESCRIPTION

Display the BluebirdPS configuration that has been imported into the current session.

There are some Twitter endpoints that requires the authenticating user's id, and potentially, the user name.
When the authentication credentials are set, the response includes these two values.
They are stored in the configuration session variable and are used when needed.

The AuthValidationDate and AuthLastExportDate values should help the user manage credential refreshes.

The RateLimitAction and RateLimitThreshold values instruct how and when to act against the Twitter API rate limits.

The ConfigurationPath and CredentialsPath values are used to export configuration and authentication.

The OutputType value specifies what type of data to return to the user.
The default OutputType is 'CustomClasses' (custom C# classes), but 'PSCustomObject' (as returned by Invoke-RestMethod) or 'JSON' can be specified.

## EXAMPLES

### Example 1

```powershell
PS > Get-BluebirdPSConfiguration
```

```text
AuthUserId         : 292670084
AuthUserName       : thedavecarroll
AuthValidationDate : 6/26/2021 5:33:03 PM
AuthLastExportDate : 5/31/2021 2:40:48 PM
RateLimitAction    : Warning
RateLimitThreshold : 5
ConfigurationPath  : C:\Users\Dave\.BluebirdPS\Configuration.json
CredentialsPath    : C:\Users\Dave\.BluebirdPS\twittercred.sav
OutputType         : CustomClasses
```

Display the current BluebirdPS configuration.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.Configuration

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Helper%20Commands/Export-BluebirdPSConfiguration)

[Import-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.7.0/Helper%20Commands/Import-BluebirdPSConfiguration)

[Get-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.7.0/Helper%20Commands/Get-BluebirdPSConfiguration)

[Set-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.7.0/Helper%20Commands/Set-BluebirdPSConfiguration)