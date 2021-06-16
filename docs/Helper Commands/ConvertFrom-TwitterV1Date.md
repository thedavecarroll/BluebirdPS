---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Helper%20Commands/ConvertFrom-TwitterV1Date
schema: 2.0.0
---

# ConvertFrom-TwitterV1Date

## SYNOPSIS

Convert a date retrieved from an API v1.1 endpoint to [DateTime].

## SYNTAX

```powershell
ConvertFrom-TwitterV1Date [-Date] <String> [<CommonParameters>]
```

## DESCRIPTION

Convert a date retrieved from an API v1.1 endpoint to [DateTime].

Converts a UTC date in the format '%a %b %d %H:%M:%S +0000 %Y' to [DateTime] format.

## EXAMPLES

### Example 1

```powershell
PS > 'Sat May 04 15:30:39 +0000 2019' | ConvertFrom-TwitterV1Date
```

```text
Saturday, May 4, 2019 10:30:39 AM
```

Convert a Twitter V1 date from the pipeline.

## PARAMETERS

### -Date

A Twitter API v1.1 date string, in the format of '%a %b %d %H:%M:%S +0000 %Y'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Helper%20Commands/ConvertFrom-TwitterV1Date)

[ConvertFrom-EpochTime](https://docs.bluebirdps.dev/en/v0.6.1/Helper%20Commands/ConvertFrom-EpochTime)
