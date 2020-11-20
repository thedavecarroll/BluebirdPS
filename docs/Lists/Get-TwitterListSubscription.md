---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription
schema: 2.0.0
---

# Get-TwitterListSubscription

## SYNOPSIS

Returns a collection of lists to which the specified user is subscribed.

## SYNTAX

### ScreenName (Default)

```powershell
Get-TwitterListSubscription -ScreenName <String> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

### UserId

```powershell
Get-TwitterListSubscription -UserId <String> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of lists to which the specified user is subscribed.

Does not include the user's own lists.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListSubscription -ScreenName thedavecarroll
```

Returns a collection of lists to which the specified user is subscribed.

## PARAMETERS

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: ScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: String
Parameter Sets: UserId
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterListSubscriber](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterList](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListMember](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterListByOwner](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Get-TwitterListTweets](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Api Reference - GET lists/subscriptions](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions)
