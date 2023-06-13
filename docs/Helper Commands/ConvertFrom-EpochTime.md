---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Helper%20Commands/ConvertFrom-EpochTime
schema: 2.0.0
---

# ConvertFrom-EpochTime

## SYNOPSIS

Convert from UNIX epoch time.

## SYNTAX

```powershell
ConvertFrom-EpochTime [-UnixTime] <String> [<CommonParameters>]
```

## DESCRIPTION

Convert from UNIX epoch time.

This command will determine if the provided UNIX time is seconds or milliseconds.

## EXAMPLES

### Example 1

```powershell
PS > ConvertFrom-EpochTime -UnixTime 1621809982
```

```text
Sunday, May 23, 2021 5:46:22 PM
```

Convert from epoch time.

### Example 2

```powershell
PS > ConvertFrom-EpochTime -UnixTime 1621723222000
```

```text
Saturday, May 22, 2021 5:40:22 PM
```

Convert from epoch time.

## PARAMETERS

### -UnixTime

The UNIX epoch time, either seconds or milliseconds.

```yaml
Type: System.String
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

### System.DateTime

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Helper%20Commands/ConvertFrom-EpochTime)

[ConvertFrom-TwitterV1Date](https://docs.bluebirdps.dev/en/v0.8.4/Helper%20Commands/ConvertFrom-TwitterV1Date)
