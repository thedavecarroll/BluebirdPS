---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version:
schema: 2.0.0
---

# Get-TwitterListTweets

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ListId (Default)
```
Get-TwitterListTweets -ListId <String> [-SinceId <Int64>] [-MaxId <Int64>] [-ResultsPerPage <Int64>]
 [-SkipStatus] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
```

### ShowSlugOwnerId
```
Get-TwitterListTweets -Slug <String> -OwnerId <Int64> [-SinceId <Int64>] [-MaxId <Int64>]
 [-ResultsPerPage <Int64>] [-SkipStatus] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
```

### ShowSlugOwnerScreenName
```
Get-TwitterListTweets -Slug <String> -OwnerScreenName <String> [-SinceId <Int64>] [-MaxId <Int64>]
 [-ResultsPerPage <Int64>] [-SkipStatus] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
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

### -ExcludeEntities
{{ Fill ExcludeEntities Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeRetweets
{{ Fill ExcludeRetweets Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ListId
{{ Fill ListId Description }}

```yaml
Type: String
Parameter Sets: ListId
Aliases: Id

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxId
{{ Fill MaxId Description }}

```yaml
Type: Int64
Parameter Sets: (All)
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

### -ResultsPerPage
{{ Fill ResultsPerPage Description }}

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinceId
{{ Fill SinceId Description }}

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipStatus
{{ Fill SkipStatus Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
