---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Get-TwitterListTweets
schema: 2.0.0
---

# Get-TwitterListTweets

## SYNOPSIS

Returns a timeline of tweets authored by members of the specified list.

## SYNTAX

### ListId (Default)

```powershell
Get-TwitterListTweets -ListId <String> [-SinceId <Int64>] [-MaxId <Int64>] [-ResultsPerPage <Int64>] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
```

### ShowSlugOwnerId

```powershell
Get-TwitterListTweets -Slug <String> -OwnerId <Int64> [-SinceId <Int64>] [-MaxId <Int64>] [-ResultsPerPage <Int64>] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
```

### ShowSlugOwnerScreenName

```powershell
Get-TwitterListTweets -Slug <String> -OwnerScreenName <String> [-SinceId <Int64>] [-MaxId <Int64>] [-ResultsPerPage <Int64>] [-ExcludeEntities] [-ExcludeRetweets] [<CommonParameters>]
```

## DESCRIPTION

Returns a timeline of tweets authored by members of the specified list.

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

### -ExcludeRetweets

By default, retweets are included. Use the ExcludeRetweets switch to omit retweets from the results.

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

### -MaxId

Returns tweets with an id less than the value provided. Tweet id values roughly correlate to a date time.

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

Returns tweets with an id equal or greater than the value provided. Tweet id values roughly correlate to a date time.

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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Get-TwitterListTweets)
