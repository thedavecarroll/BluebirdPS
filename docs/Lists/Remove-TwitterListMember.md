---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Remove-TwitterListMember
schema: 2.0.0
---

# Remove-TwitterListMember

## SYNOPSIS

Removes one or more users from a list.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterListMember -Id <String> [-User <User[]>] [<CommonParameters>]
```

### ByList

```powershell
Remove-TwitterListMember -List <List> [-User <User[]>] [<CommonParameters>]
```

## DESCRIPTION

Removes one or more users from a list.

The authenticated user must own the list to be able to remove members from it.

Please note that there can be issues with lists that rapidly remove and add memberships.
Take care when using these methods such that you are not too rapidly switching between removals and adds on the same list.

## EXAMPLES

### Example 1

```powershell
PS > $MyUser = Get-TwitterUser -User BluebirdPS
PS > Get-TwitterList -Id 1587300786052243459 | Remove-TwitterListMember -User $MyUser
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

```text
User BluebirdPS is not a member of list Id: 1587300786052243459, Name: Sample-List, Members: 0
```

Remove the specified user from the specified list.

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
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

One or more Twitter user objects to remove from the list, up to a maximum of 100 per request.

```yaml
Type: System.String[]
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
Type: System.Management.Automation.SwitchParameter
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
Type: System.Management.Automation.SwitchParameter
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Remove-TwitterListMember)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterListMember)

[Add-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Add-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList)

[Api Reference - DELETE /2/lists/:id/members/:user_id](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/delete-lists-id-members-user_id)
