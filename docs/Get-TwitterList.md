---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version:
schema: 2.0.0
---

# Get-TwitterList

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ListScreenName (Default)
```
Get-TwitterList -ScreenName <String> [-OwnedListFirst] [<CommonParameters>]
```

### ListUserId
```
Get-TwitterList -UserId <String> [-OwnedListFirst] [<CommonParameters>]
```

### ShowId
```
Get-TwitterList -ListId <String> [<CommonParameters>]
```

### ShowSlugOwnerId
```
Get-TwitterList -Slug <String> -OwnerId <Int64> [<CommonParameters>]
```

### ShowSlugOwnerScreenName
```
Get-TwitterList -Slug <String> -OwnerScreenName <String> [<CommonParameters>]
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

### -ListId
{{ Fill ListId Description }}

```yaml
Type: String
Parameter Sets: ShowId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnedListFirst
{{ Fill OwnedListFirst Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ListScreenName, ListUserId
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnerId
{{ Fill OwnerId Description }}

```yaml
Type: Int64
Parameter Sets: ShowSlugOwnerId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnerScreenName
{{ Fill OwnerScreenName Description }}

```yaml
Type: String
Parameter Sets: ShowSlugOwnerScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenName
{{ Fill ScreenName Description }}

```yaml
Type: String
Parameter Sets: ListScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Slug
{{ Fill Slug Description }}

```yaml
Type: String
Parameter Sets: ShowSlugOwnerId, ShowSlugOwnerScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
{{ Fill UserId Description }}

```yaml
Type: String
Parameter Sets: ListUserId
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
