---
external help file: Twitter-help.xml
Module Name: Twitter
online version:
schema: 2.0.0
---

# Get-TwitterFriendship

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### LookupScreenName (Default)
```
Get-TwitterFriendship -ScreenName <String[]> [<CommonParameters>]
```

### LookupUserId
```
Get-TwitterFriendship -UserId <Int32[]> [<CommonParameters>]
```

### ShowScreenName
```
Get-TwitterFriendship -SourceScreenName <String> -TargetScreenName <String> [<CommonParameters>]
```

### ShowUserId
```
Get-TwitterFriendship -SourceUserId <Int32> -TargetUserId <Int32> [<CommonParameters>]
```

### Incoming
```
Get-TwitterFriendship [-Incoming] [<CommonParameters>]
```

### Pending
```
Get-TwitterFriendship [-Pending] [<CommonParameters>]
```

### NoRetweets
```
Get-TwitterFriendship [-NoRetweets] [<CommonParameters>]
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

### -Incoming
{{ Fill Incoming Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Incoming
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoRetweets
{{ Fill NoRetweets Description }}

```yaml
Type: SwitchParameter
Parameter Sets: NoRetweets
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pending
{{ Fill Pending Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Pending
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenName
{{ Fill ScreenName Description }}

```yaml
Type: String[]
Parameter Sets: LookupScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SourceScreenName
{{ Fill SourceScreenName Description }}

```yaml
Type: String
Parameter Sets: ShowScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceUserId
{{ Fill SourceUserId Description }}

```yaml
Type: Int32
Parameter Sets: ShowUserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetScreenName
{{ Fill TargetScreenName Description }}

```yaml
Type: String
Parameter Sets: ShowScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetUserId
{{ Fill TargetUserId Description }}

```yaml
Type: Int32
Parameter Sets: ShowUserId
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
Type: Int32[]
Parameter Sets: LookupUserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

### System.Int32[]

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
