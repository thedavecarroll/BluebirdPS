---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Export-TwitterResource
schema: 2.0.0
---

# Export-TwitterResource

## SYNOPSIS

Connects to Twitter to retrieve the specified resource and saves it to file.

## SYNTAX

### Configuration

```powershell
Export-TwitterResource [-Configuration] [<CommonParameters>]
```

### Languages

```powershell
Export-TwitterResource [-Languages] [<CommonParameters>]
```

## DESCRIPTION

Connects to Twitter to retrieve the specified resource and saves it to file.

The resource data will be stored in the folder $env:HOME/.BluebirdPS.

## EXAMPLES

### Example 1

```powershell
PS > Export-TwitterResource -Configuration -Verbose
```

```console
VERBOSE: Saved Twitter Configuration to C:\Users\Dave\.BluebirdPS\TwitterConfiguration.json
```

Export the configuration data.

### Example 2

```powershell
PS > Export-TwitterResource -Languages
```

Export the languages data.

## PARAMETERS

### -Configuration

Download the configuration data using `Get-TwitterConfiguration` and saves the results.

```yaml
Type: SwitchParameter
Parameter Sets: Configuration
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Languages

Download the configuration data using `Get-TwitterLanguages` and saves the results.

```yaml
Type: SwitchParameter
Parameter Sets: Languages
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Export-TwitterResource)

[Get-TwitterConfiguration](https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Get-TwitterConfiguration)

[Get-TwitterLanguages](https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Get-TwitterLanguages)
