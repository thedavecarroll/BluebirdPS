---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Lists/Remove-TwitterListMember
schema: 2.0.0
---

# Remove-TwitterListMember

## SYNOPSIS

Removes one or more users from a list.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterListMember -Id <String> -UserName <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByList

```powershell
Remove-TwitterListMember -List <List> -UserName <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Removes one or more users from a list.

The authenticated user must own the list to be able to remove members from it.

Please note that there can be issues with lists that rapidly remove and add memberships.
Take care when using these methods such that you are not too rapidly switching between removals and adds on the same list.

## EXAMPLES

### Example 1

```powershell

PS > Remove-TwitterListMember -Id 1397040831777984512 -UserName thedavecarroll
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

Remove the user thedavecarroll from the specified list.

### Example 2

```powershell
PS > Remove-TwitterListMember -Id 1397040831777984512 -UserName TwitterDev,TwitterAPI
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Remove users from list" on target "Id: 1397040831777984512 - UserNames:
TwitterDev,TwitterAPI, Total Users: 2".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

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

Remove the users TwitterDev and TwitterAPI from the specified list.

### Example 3

```powershell
PS > Get-TwitterList -Id 1397040831777984512 | Remove-TwitterListMember -UserName BluebirdPS
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Remove users from list" on target "Id: 1397040831777984512, Name: Updated-List-Name -
UserName: BluebirdPS".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

Id              : 1397040831777984512
CreatedAt       : 5/24/2021 11:04:24 PM
Slug            : sample-list-10878
Name            : Updated-List-Name
FullName        : @thedavecarroll/sample-list-10878
Description     : New description for this list.
Uri             : https://twitter.com/thedavecarroll/lists/sample-list-10878
Mode            : Private
MemberCount     : 0
SubscriberCount : 0
UserId          : 292670084
UserName        : thedavecarroll
Following       : True
```

Remove the user BluebirdPS from the specified list.

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
Accept pipeline input: True (ByValue)
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

### -UserName

One or more usernames to remove from the list, up to a maximum of 100 per request.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### BluebirdPS.APIV1.List

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Remove-TwitterListMember)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListMember)

[Add-TwitterListMember](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Add-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterList)

[Api Reference - POST lists/members/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy)

[Api Reference - POST lists/members/destroy_all](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all)
