---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Set-TwitterList
schema: 2.0.0
---

# Set-TwitterList

## SYNOPSIS

Updates the specified list.

## SYNTAX

### ById (Default)

```powershell
Set-TwitterList -Id <String> [-Name <String>] [-Description <String>] [-Private <Boolean>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByList

```powershell
Set-TwitterList -List <List> [-Name <String>] [-Description <String>] [-Private <Boolean>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Updates the specified list.

The authenticated user must own the list to be able to update it.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList -Id 1587297863276679169 | Set-TwitterList -Name 'List Example' -Description 'This is a Set-TwitterList example'
```

```text
Id            : 1587297863276679169
Name          : Sample List
CreatedAt     : 11/1/2022 4:17:55 AM
FollowerCount : 0
MemberCount   : 0
Description   : test description
Private       : True
OwnerId       : 292670084

Confirm
Are you sure you want to perform this action?
Performing the operation "Update list" on target "Id: 1587297863276679169, Name: Sample List, Members: 0, Followers: 0, Created: 11/1/2022 4:17:55 AM, Description: test description".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

Id            : 1587297863276679169
Name          : List Example
CreatedAt     : 11/1/2022 4:17:55 AM
FollowerCount : 0
MemberCount   : 0
Description   : This is a Set-TwitterList example
Private       : True
OwnerId       : 292670084
```

Update the Name and Description for the list.

Note: The list slug does not change when you rename the list, therefore neither does the list URL.

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

### -Name

The new name for the list.

```yaml
Type: System.String
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
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Private

Specifies whether the list will be private.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
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

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

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

### BluebirdPS.APIV2.ListInfo.List

## OUTPUTS

### BluebirdPS.APIV2.ListInfo.List

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Set-TwitterList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Add-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterList)

[Remove-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterList)

[Api Reference - PUT /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/put-lists-id)
