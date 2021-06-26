---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Lists/Get-TwitterListMember
schema: 2.0.0
---

# Get-TwitterListMember

## SYNOPSIS

Returns the username for members of the specified list.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterListMember -Id <String> [<CommonParameters>]
```

### ByList

```powershell
Get-TwitterListMember -List <List> [<CommonParameters>]
```

## DESCRIPTION

Returns the username for members of the specified list.

Private list members will only be shown if the authenticated user owns the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListMember -Id 749356646665629696
```

Returns the members of the specified list.

### Example 2

```powershell
PS > Get-TwitterListMember -Slug powershell-team -OwnerUserName powershell_team
```

Returns the members of the specified list.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Lists/Get-TwitterListMember)

[Add-TwitterListMember](https://docs.bluebirdps.dev/en/v0.7.0/Lists/Add-TwitterListMember)

[Remove-TwitterListMember](https://docs.bluebirdps.dev/en/v0.7.0/Lists/Remove-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.7.0/Lists/Get-TwitterList)

[Api Reference - GET lists/members](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members)
