---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Publish-TwitterDM
schema: 2.0.0
---

# Publish-TwitterDM

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
Publish-TwitterDM [-UserId] <String> [-Message] <String> [[-MediaId] <String>] [<CommonParameters>]
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

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: String
Parameter Sets: (All)
Aliases: media_id

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Message
{{ Fill Message Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user to which you want to send a direct message.

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Publish-TwitterDM)
