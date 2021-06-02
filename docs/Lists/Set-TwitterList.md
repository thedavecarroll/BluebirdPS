---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Lists/Set-TwitterList
schema: 2.0.0
---

# Set-TwitterList

## SYNOPSIS

Updates the specified list.

## SYNTAX

### ById (Default)

```powershell
Set-TwitterList -Id <String> [-Name <String>] [-Description <String>] [-Mode <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByList

```powershell
Set-TwitterList -List <List> [-Name <String>] [-Description <String>] [-Mode <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Updates the specified list.

The authenticated user must own the list to be able to update it.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList -Id 1397040831777984512
PS > Get-TwitterList -Id 1397040831777984512 | Set-TwitterList -Name 'Updated-List-Name' -Description 'New description for this list.'
```

```text
Id              : 1397040831777984512
CreatedAt       : 5/24/2021 11:04:24 PM
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
Following       : True

Confirm
Are you sure you want to perform this action?
Performing the operation "Updating list Id: 1397040831777984512, Name: Sample-List properties" on target "Name,
Description".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

Id              : 1397040831777984512
CreatedAt       : 1/19/1970 12:31:55 PM
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
Following       : False
```

Update the Name and Description for the list.

Note: The list slug does not change when you rename the list, therefore neither does the list URL.

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

### -Name

The new name for the list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description

The new description for the list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode

The new mode for the list.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Private, Public

Required: False
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

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

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

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Set-TwitterList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterList)

[Add-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Add-TwitterList)

[Remove-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Remove-TwitterList)

[Api Reference - POST lists/update](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update)
