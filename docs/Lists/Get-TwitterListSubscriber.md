---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterListSubscriber
schema: 2.0.0
---

# Get-TwitterListSubscriber

## SYNOPSIS

Returns a collection of subscriber usernames of the specified list.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterListSubscriber -Id <String> [<CommonParameters>]
```

### ByList

```powershell
Get-TwitterListSubscriber -List <List> [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of subscriber usernames of the specified list.

Private list subscribers will only be shown if the authenticated user owns the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListSubscriber -ListId 857199747848957957
```

Returns the users that subscribe to the list specified.

### Example 2

```powershell
PS > Get-TwitterList -Slug microsoft-evangelicals -OwnerUserName thedavecarroll | Get-TwitterListSubscriber
```

Returns the users that are subscribe to the list specified.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: List
Parameter Sets: ByList
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

### None

## OUTPUTS

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterListSubscriber)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterList)

[Api Reference - GET lists/subscribers](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers)
