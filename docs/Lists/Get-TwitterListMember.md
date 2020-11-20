---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember
schema: 2.0.0
---

# Get-TwitterListMember

## SYNOPSIS

Returns the members of the specified list.

## SYNTAX

### ListId (Default)

```powershell
Get-TwitterListMember -ListId <String> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

### ShowSlugOwnerId

```powershell
Get-TwitterListMember -Slug <String> -OwnerId <Int64> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

### ShowSlugOwnerScreenName

```powershell
Get-TwitterListMember -Slug <String> -OwnerScreenName <String> [-ResultsPerPage <Int32>] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns the members of the specified list.

Private list members will only be shown if the authenticated user owns the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListMember -ListId 749356646665629696 -ExcludeEntities -SkipStatus
```

Returns the members of the specified list, but exclude the statuses and entities node.

### Example 2

```powershell
PS > Get-TwitterListMember -Slug powershell-team -OwnerScreenName powershell_team
```

Returns the members of the specified list.

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

The user id that owns the list specified by the Slug parameter.

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

The screen name of the user that owns the list specified by the Slug parameter.

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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterListByOwner](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Get-TwitterList](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListSubscriber](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterListSubscription](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterListTweets](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Api Reference - GET lists/members](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members)
