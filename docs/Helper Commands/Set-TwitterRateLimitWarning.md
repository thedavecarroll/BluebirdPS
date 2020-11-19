---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Helper+Commands/Set-TwitterRateLimitWarning
schema: 2.0.0
---

# Set-TwitterRateLimitWarning

## SYNOPSIS

Sets the session setting for the Rate Limit Warning.

## SYNTAX

### Enable

```powershell
Set-TwitterRateLimitWarning [-Enable] [<CommonParameters>]
```

### Disable

```powershell
Set-TwitterRateLimitWarning [-Disable] [<CommonParameters>]
```

## DESCRIPTION

Sets the session setting for the Rate Limit Warning.

If this setting is enabled, a warning message will be displayed for each rate limited API call.

Notes:
The warning will be always displayed when the remaining available API calls are five (5) or less.
This setting is disabled at the beginning of the session.

## EXAMPLES

### Example 1

```powershell
PS > Set-TwitterRateLimitWarning -Enable
```

Enable the rate limit warning.

### Example 2

```powershell
PS > Set-TwitterRateLimitWarning -Disable
```

Disable the rate limit warning.

## PARAMETERS

### -Enable

Enable the rate limit warning.

```yaml
Type: SwitchParameter
Parameter Sets: Enable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Disable

Disable the rate limit warning.

```yaml
Type: SwitchParameter
Parameter Sets: Disable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Helper+Commands/Set-TwitterRateLimitWarning)

[Get-TwitterRateLimitWarning](https://bluebirdps.anovelidea.org/en/latest/Helper+Commands/Get-TwitterRateLimitWarning)
