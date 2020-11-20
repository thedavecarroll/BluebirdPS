---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets
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
PS > Get-TwitterListTweets -ListId 79064151 -Count 50
```

Return the last 50 tweets from members of the specified list.

### Example 2

```powershell
PS > Get-TwitterListTweets -Slug psconfbook -OwnerScreenName mikefrobbins -Count 10 -ExcludeEntities -ExcludeRetweets
```

Return the last 10 tweets from members of the specified list, excluding retweets and the entities node.

## PARAMETERS

### -ListId

The numerical id of the list.

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

### -Slug

Returns the specified list based on the slug which is derived from the name of the list.

Note: Provide the list owner when returning a list based on the slug.

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

### -Count

Specifies the number of results to retrieve.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Get-TwitterListMember](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterList](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListSubscription](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterListSubscriber](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterListByOwner](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Api Reference - GET lists/statuses](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses)
