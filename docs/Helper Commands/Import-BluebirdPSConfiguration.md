---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Import-BluebirdPSConfiguration
schema: 2.0.0
---

# Import-BluebirdPSConfiguration

## SYNOPSIS

Import the user's configuration values from disk.

## SYNTAX

```powershell
Import-BluebirdPSConfiguration [<CommonParameters>]
```

## DESCRIPTION

Import the user's configuration values from disk.

This will override the current session's configuration variable.

This command is called when the module is imported.

Beginning with v0.8.2, the value for RateLimitAction can be set with the environment variable BLUEBIRDPS_RATE_LIMIT_ACTION.
If the environment variable exists and the value is one of the allowed types, the Configuration value will be overridden for the session.

## EXAMPLES

### Example 1

```powershell
PS > Import-BluebirdPSConfiguration
```

Import the user's configuration values from disk.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Import-BluebirdPSConfiguration)

[Export-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Export-BluebirdPSConfiguration)

[Get-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Get-BluebirdPSConfiguration)

[Set-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Set-BluebirdPSConfiguration)
