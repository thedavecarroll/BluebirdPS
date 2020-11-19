---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner
schema: 2.0.0
---

# Get-TwitterListByOwner

## SYNOPSIS

Returns the lists owned by the specified user.

## SYNTAX

### ScreenName (Default)

```powershell
Get-TwitterListByOwner -ScreenName <String> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

### UserId

```powershell
Get-TwitterListByOwner -UserId <Int64> [-ResultsPerPage <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Returns the lists owned by the specified user.

Private lists will only be shown if the authenticated user is also the owner of the lists.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListByOwner -ScreenName thedavecarroll
```

Returns the list owned by the specified user.

## PARAMETERS

### -ResultsPerPage

Specifies the number of results to retrieve per page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Count

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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
Type: Int64
Parameter Sets: UserId
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListByOwner)

[Get-TwitterList](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterList)

[Get-TwitterListMember](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListMember)

[Get-TwitterListSubscriber](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscriber)

[Get-TwitterListSubscription](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListSubscription)

[Get-TwitterListTweets](https://bluebirdps.anovelidea.org/en/latest/Lists/Get-TwitterListTweets)

[Api Reference - GET lists/ownerships](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships)
