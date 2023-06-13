---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Add-TwitterListMember
schema: 2.0.0
---

# Add-TwitterListMember

## SYNOPSIS

Add one or more users to a list.

## SYNTAX

### ById (Default)

```powershell
Add-TwitterListMember -Id <String> [-User <User[]>] [<CommonParameters>]
```

### ByList

```powershell
Add-TwitterListMember -List <List> [-User <User[]>] [<CommonParameters>]
```

## DESCRIPTION

Add one or more users to a list.

The authenticated user must own the list to be able to add members to it.

Lists can't have more than 5,000 members.

Please note that there can be issues with lists that rapidly remove and add memberships.
Take care when using these methods such that you are not too rapidly switching between removals and adds on the same list.

## EXAMPLES

### Example 1

```powershell
PS > $Users = Get-TwitterUser -User thedavecarroll,BluebirdPS
PS > $List = Get-TwitterList -Id 1587300786052243459
PS > $Users | Add-TwitterListMember -List $List
```

```text
User Dave Carroll added to list Id: 1587300786052243459, Name: TestAdditionRemoval
User BluebirdPS added to list Id: 1587300786052243459, Name: TestAdditionRemoval
```

Get the users thedavecarroll and BluebirdPS, then add them to the specified list.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: System.String
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
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: ByList
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User

One or more user objects, returned by Get-TwitterUser, to follow.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### ### BluebirdPS.APIV1.List

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Add-TwitterListMember)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterListMember)

[Remove-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Remove-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList)

[Api Reference - POST /2/lists/:id/members](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/post-lists-id-members)
