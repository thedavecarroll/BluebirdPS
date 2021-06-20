---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Lists/Add-TwitterList
schema: 2.0.0
---

# Add-TwitterList

## SYNOPSIS

Creates a new list for the authenticated user.

## SYNTAX

```powershell
Add-TwitterList [-Name] <String> [[-Description] <String>] [[-Mode] <String>] [<CommonParameters>]
```

## DESCRIPTION

Creates a new list for the authenticated user.

Note that you can create up to 1000 lists per account.

## EXAMPLES

### Example 1

```powershell
PS > Add-TwitterList -Name Sample-List -Description 'A sample list' -Mode Private
```

```text
Id              : 1397040831777984512
CreatedAt       : 1/19/1970 12:31:55 PM
Slug            : sample-list-10878
Name            : Sample-List
FullName        : @thedavecarroll/sample-list-10878
Description     : A sample list
Uri             : https://twitter.com/thedavecarroll/lists/sample-list-10878
Mode            : Private
MemberCount     : 0
SubscriberCount : 0
UserId          : 292670084
UserName        : thedavecarroll
Following       : False
```

Create a private list named Sample-List with the specified description.

## PARAMETERS

### -Name

The name for the list.
A list's name must start with a letter and can consist only of 25 or fewer letters, numbers, "-", or "_" characters.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description

The description to give the list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode

Creates your list as public or private. By default, lists are created as public.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Private, Public

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.APIV1.List

### BluebirdPS.APIV1.List[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Add-TwitterList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterList)

[Remove-TwitterList](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Remove-TwitterList)

[Set-TwitterList](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Set-TwitterList)

[Api Reference - POST lists/create](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create)
