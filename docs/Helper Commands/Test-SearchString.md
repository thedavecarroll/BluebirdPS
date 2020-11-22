---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Test-SearchString
schema: 2.0.0
---

# Test-SearchString

## SYNOPSIS

Validate a Twitter search string.

## SYNTAX

```powershell
Test-SearchString [-SearchString] <String> [<CommonParameters>]
```

## DESCRIPTION

Validate a Twitter search string.

Currently, this only validates against length.

## EXAMPLES

### Example 1

```powershell
PS > Test-SearchString -SearchString '(from:thedavecarroll) (#BluebirdPS)'
```

Validate a Twitter search string.

## PARAMETERS

### -SearchString

The search string consisting of text and Twitter search operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Test-SearchString)
