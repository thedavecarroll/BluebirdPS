---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Get-TwitterListByOwner
schema: 2.0.0
---

# Get-TwitterListByOwner

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ScreenName (Default)
```
Get-TwitterListByOwner -ScreenName <String> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

### UserId
```
Get-TwitterListByOwner -UserId <Int64> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ResultsPerPage

Specifies the number of results to retrieve per page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Count

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: ScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: Int64
Parameter Sets: UserId
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Get-TwitterListByOwner)
