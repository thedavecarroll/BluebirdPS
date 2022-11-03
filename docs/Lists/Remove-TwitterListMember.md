---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListMember
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListMember)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListMember)

[Add-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Api Reference - POST lists/members/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy)

[Api Reference - POST lists/members/destroy_all](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all)
