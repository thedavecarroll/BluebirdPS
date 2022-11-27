---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Add-TwitterSavedSearch
schema: 2.0.0
---

# Add-TwitterSavedSearch

## SYNOPSIS

Create a new saved search for the authenticated user.

## SYNTAX

```powershell
Add-TwitterSavedSearch [-SearchString] <String> [<CommonParameters>]
```

## DESCRIPTION

Create a new saved search for the authenticated user.

Note: A user may only have 25 saved searches.

## EXAMPLES

### Example 1

```powershell
PS > Add-TwitterSavedSearch -SearchString '(#pwsh_eats)'
```

```text
Id                  CreatedAt            Name         Query
--                  ---------            ----         -----
1399362817376014341 5/31/2021 8:51:09 AM (#pwsh_eats) (#pwsh_eats)
```

Add a new saved search for the #pwsh_eats hashtag.

## PARAMETERS

### -SearchString

The query of the search the user would like to save.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### BluebirdPS.APIV1.SavedSearch

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Add-TwitterSavedSearch)

[Get-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.8.3/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterSavedSearch)

[Remove-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.8.3/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Remove-TwitterSavedSearch)

[Api Reference - Search Standard Operators](https://developer.twitter.com/en/docs/twitter-api/v1/rules-and-filtering/overview/standard-operators)

[Api Reference - POST saved_searches/create](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create)
