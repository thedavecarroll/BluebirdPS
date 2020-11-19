---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList
schema: 2.0.0
---

# Get-TwitterList

## SYNOPSIS

Returns a specific list or all lists the authenticating or specified user subscribes to, including their own.

## SYNTAX

### ListScreenName (Default)

```powershell
Get-TwitterList [-ScreenName <String>] [-OwnedListFirst] [<CommonParameters>]
```

### ListUserId

```powershell
Get-TwitterList -UserId <String> [-OwnedListFirst] [<CommonParameters>]
```

### ShowId

```powershell
Get-TwitterList -ListId <String> [<CommonParameters>]
```

### ShowSlugOwnerId

```powershell
Get-TwitterList -Slug <String> -OwnerId <Int64> [<CommonParameters>]
```

### ShowSlugOwnerScreenName

```powershell
Get-TwitterList -Slug <String> -OwnerScreenName <String> [<CommonParameters>]
```

## DESCRIPTION

Returns a specific list or all lists the authenticating or specified user subscribes to, including their own.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList
```

Returns the lists owned by the authenticating user.

### Example 2

```powershell
PS > Get-TwitterList -UserId 123456789
```

Returns the lists owned by the specified user.

### Example 3

```powershell
PS > Get-TwitterList -ListId 749356646665629696
```

Returns the specified list.

### Example 4

```powershell
PS > Get-TwitterList -Slug powershell-team -OwnerScreenName powershell_team
```

Returns the specified list owned by the specified owner.

## PARAMETERS

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: ListScreenName
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

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

### -OwnedListFirst

Return the authenticating user's lists first.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListByOwner](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Get-TwitterListMember](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterListSubscriber](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterListSubscription](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterListTweets](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Api Reference - GET lists/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list)

[Api Reference - GET lists/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show)
