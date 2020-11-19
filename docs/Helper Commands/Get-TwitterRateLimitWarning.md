---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterRateLimitWarning
schema: 2.0.0
---

# Get-TwitterRateLimitWarning

## SYNOPSIS

Returns the session setting for the Rate Limit Warning.

## SYNTAX

```powershell
Get-TwitterRateLimitWarning [<CommonParameters>]
```

## DESCRIPTION

Returns the session setting for the Rate Limit Warning.

If this setting is enabled, a warning message will be displayed for each rate limited API call.

Notes:
The warning will be always displayed when the remaining available API calls are five (5) or less.
This setting is disabled at the beginning of the session.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterRateLimitWarning
```

```console
RateLimitWarning is set to Enabled
```

Returns the session setting for the Rate Limit Warning.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterRateLimitWarning)

[Set-TwitterRateLimitWarning](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Set-TwitterRateLimitWarning)
