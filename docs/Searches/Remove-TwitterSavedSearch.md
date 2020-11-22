---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Searches/Remove-TwitterSavedSearch
schema: 2.0.0
---

# Remove-TwitterSavedSearch

## SYNOPSIS

Deletes the specified saved search belonging to the authenticating user.

## SYNTAX

```powershell
Remove-TwitterSavedSearch [-SearchId] <Int64[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Deletes the specified saved search belonging to the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Remove-TwitterSavedSearch -SearchId 1225849015092367362
```

```console
Confirm
Are you sure you want to perform this action?
Performing the operation "Removing Saved Search" on target "Search : (#PoShEvents) (from:thedavecarroll), Created: Fri Feb 07 18:29:15 +0000 2020".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Deletes the specified saved search belonging to the authenticating user.

## PARAMETERS

### -SearchId

The id of the saved search.

```yaml
Type: Int64[]
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 0
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Searches/Remove-TwitterSavedSearch)

[Get-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Get-TwitterSavedSearch)

[Add-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Add-TwitterSavedSearch)

[Api Reference - POST saved_searches/destroy/:id](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-destroy-id)
