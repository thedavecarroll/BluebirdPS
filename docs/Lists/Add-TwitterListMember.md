---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListMember
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
PS > Add-TwitterListMember -Id 1397040831777984512 -UserName thedavecarroll
```

```text
Id              : 1397040831777984512
CreatedAt       : 5/24/2021 11:04:24 PM
Slug            : sample-list-10878
Name            : Updated-List-Name
FullName        : @thedavecarroll/sample-list-10878
Description     : New description for this list.
Uri             : https://twitter.com/thedavecarroll/lists/sample-list-10878
Mode            : Private
MemberCount     : 1
SubscriberCount : 0
UserId          : 292670084
UserName        : thedavecarroll
Following       : True
```

Add the user thedavecarroll to the specified list.

### Example 2

```powershell
PS > Add-TwitterListMember -Id 1397040831777984512 -UserName TwitterDev,TwitterAPI
```

```text
Id              : 1397040831777984512
CreatedAt       : 5/24/2021 11:04:24 PM
Slug            : sample-list-10878
Name            : Updated-List-Name
FullName        : @thedavecarroll/sample-list-10878
Description     : New description for this list.
Uri             : https://twitter.com/thedavecarroll/lists/sample-list-10878
Mode            : Private
MemberCount     : 3
SubscriberCount : 0
UserId          : 292670084
UserName        : thedavecarroll
Following       : True
```

Add the users TwitterDev and TwitterAPI to the specified list.

### Example 3

```powershell
PS > Get-TwitterList -Id 1397040831777984512 | Add-TwitterListMember -UserName BluebirdPS
```

```text
Id              : 1397040831777984512
CreatedAt       : 5/24/2021 11:04:24 PM
Slug            : sample-list-10878
Name            : Updated-List-Name
FullName        : @thedavecarroll/sample-list-10878
Description     : New description for this list.
Uri             : https://twitter.com/thedavecarroll/lists/sample-list-10878
Mode            : Private
MemberCount     : 4
SubscriberCount : 0
UserId          : 292670084
UserName        : thedavecarroll
Following       : True
```

Add the user BluebirdPS to the specified list.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: System.String
Parameter Sets: ById
Aliases: ListId

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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListMember)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListMember)

[Remove-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Api Reference - POST /2/lists/:id/members](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/post-lists-id-members)
