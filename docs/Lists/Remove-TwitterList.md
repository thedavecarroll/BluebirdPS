---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Lists/Remove-TwitterList
schema: 2.0.0
---

# Remove-TwitterList

## SYNOPSIS

Removes the specified list.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterList -Id <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByList

```powershell
Remove-TwitterList -List <List> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Removes the specified list.

The authenticated user must own the list to be able to remove it.

## EXAMPLES

### Example

```powershell
PS > Remove-TwitterList -Id 1396433456926703621
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Removing List" on target "Name: Daves_Test-List, Members: 0, Subscribers: 0, Created:
5/23/2021 6:50:55 AM, Description: ".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Remove the specified list.

### Example 1

```powershell
PS > Get-TwitterList -Id 1396433456926703621 | Remove-TwitterList
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Removing List" on target "Name: Daves_Test-List, Members: 0, Subscribers: 0, Created:
5/23/2021 6:50:55 AM, Description: ".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Remove the specified list.

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
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: ByList
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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
Default value: False
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
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Remove-TwitterList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Get-TwitterList)

[Add-TwitterList](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Add-TwitterList)

[Set-TwitterList](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Set-TwitterList)

[Api Reference - DELETE /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/manage-lists/api-reference/delete-lists-id)
