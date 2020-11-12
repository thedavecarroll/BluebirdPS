---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version:
schema: 2.0.0
---

# Get-TwitterListMember

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ListId (Default)
```
Get-TwitterListMember -ListId <String> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities]
 [<CommonParameters>]
```

### ShowSlugOwnerId
```
Get-TwitterListMember -Slug <String> -OwnerId <Int64> [-ResultsPerPage <Int32>] [-SkipStatus]
 [-ExcludeEntities] [<CommonParameters>]
```

### ShowSlugOwnerScreenName
```
Get-TwitterListMember -Slug <String> -OwnerScreenName <String> [-ResultsPerPage <Int32>] [-SkipStatus]
 [-ExcludeEntities] [<CommonParameters>]
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

Exclude the entities node.

This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags.

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
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnerId

The ID of the list owner for whom to return results.

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

The screen name of the user for whom to return results.

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

Specifies the number of results to retrieve per page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipStatus

Exclude the user statuses from the returned user objects.

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
