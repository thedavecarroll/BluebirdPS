---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Remove-TwitterSavedSearch
schema: 2.0.0
---

# Remove-TwitterSavedSearch

## SYNOPSIS

Deletes the specified saved search belonging to the authenticating user.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterSavedSearch -Id <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```

### BySavedSearch

```powershell
Remove-TwitterSavedSearch -SavedSearch <SavedSearch> [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Deletes the specified saved search belonging to the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Remove-TwitterSavedSearch -Id 1225849015092367362
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Removing Saved Search" on target "Search : (#PoShEvents) (from:thedavecarroll), Created: Fri Feb 07 18:29:15 +0000 2020".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Deletes the specified saved search belonging to the authenticating user.

### Example 2

```powershell
PS > Get-TwitterSavedSearch -Id 1325982551094210566 | Remove-TwitterSavedSearch
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Removing Saved Search" on target "Search: (#pwsh_eats), Created: 11/9/2020 8:04:10 PM".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Gets the specified saved search then deletes it, if belonging to the authenticating user.

## PARAMETERS

### -Id

The id of the saved search.

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
Default value: False
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
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Remove-TwitterSavedSearch)

[Get-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterSavedSearch)

[Add-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Add-TwitterSavedSearch)

[Api Reference - POST saved_searches/destroy/:id](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-destroy-id)
