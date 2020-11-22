---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Searches/Get-TwitterSavedSearch
schema: 2.0.0
---

# Get-TwitterSavedSearch

## SYNOPSIS

Returns one or all of the authenticating user's saved searches.

## SYNTAX

```powershell
Get-TwitterSavedSearch [[-SearchId] <Int64>] [<CommonParameters>]
```

## DESCRIPTION

Returns one or all of the authenticating user's saved searches.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterSavedSearch
```

```console
id         : 1225849015092367362
id_str     : 1225849015092367362
query      : (#PoShEvents) (from:thedavecarroll)
name       : (#PoShEvents) (from:thedavecarroll)
position   :
created_at : Fri Feb 07 18:29:15 +0000 2020

id         : 1316223626610343936
id_str     : 1316223626610343936
query      : (from:JeffHicks) (#PSTweetChat)
name       : (from:JeffHicks) (#PSTweetChat)
position   :
created_at : Wed Oct 14 03:45:41 +0000 2020

id         : 1325982551094210566
id_str     : 1325982551094210566
query      : (#pwsh_eats)
name       : (#pwsh_eats)
position   :
created_at : Tue Nov 10 02:04:10 +0000 2020
```

Returns all of the authenticating user's saved searches.

### Example 2

```powershell
PS > Get-TwitterSavedSearch -SearchId 1316223626610343936
```

```console

id         : 1316223626610343936
id_str     : 1316223626610343936
query      : (from:JeffHicks) (#PSTweetChat)
name       : (from:JeffHicks) (#PSTweetChat)
position   :
created_at : Wed Oct 14 03:45:41 +0000 2020
```

Returns the authenticating user's specified saved search.

## PARAMETERS

### -SearchId

The id of the saved search.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: Id

Required: False
Position: 0
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Searches/Get-TwitterSavedSearch)

[Add-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Add-TwitterSavedSearch)

[Remove-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Remove-TwitterSavedSearch)

[Api Reference - GET saved_searches/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list)

[Api Reference - GET saved_searches/show/:id](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list)
