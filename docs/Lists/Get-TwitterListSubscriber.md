---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber
schema: 2.0.0
---

# Get-TwitterListSubscriber

## SYNOPSIS

Returns the subscribers of the specified list.

## SYNTAX

### ShowId

```powershell
Get-TwitterListSubscriber -ListId <String> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

### ShowSlugOwnerId

```powershell
Get-TwitterListSubscriber -Slug <String> -OwnerId <Int64> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

### ShowSlugOwnerScreenName

```powershell
Get-TwitterListSubscriber -Slug <String> -OwnerScreenName <String> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns the subscribers of the specified list.

Private list subscribers will only be shown if the authenticated user owns the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListSubscriber -ListId 857199747848957957
```

Returns the users that subscribe to the list specified.

### Example 2

```powershell
PS > Get-TwitterListSubscriber -Slug microsoft-evangelicals -OwnerScreenName thedavecarroll
```

Returns the users that are subscribe to the list specified.

## PARAMETERS

### -ListId

The numerical id of the list.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterListSubscription](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterList](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListMember](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterListByOwner](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Get-TwitterListTweets](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Api Reference - GET lists/subscribers](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers)
