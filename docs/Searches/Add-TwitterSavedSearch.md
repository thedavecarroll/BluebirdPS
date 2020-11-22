---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Searches/Add-TwitterSavedSearch
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

```console
id         : 1325982551094210566
id_str     : 1325982551094210566
query      : (#pwsh_eats)
name       : (#pwsh_eats)
position   :
created_at : Tue Nov 10 02:04:10 +0000 2020
```

Add a new saved search for the #pwsh_eats hashtag.

## PARAMETERS

### -SearchString

The query of the search the user would like to save.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Searches/Add-TwitterSavedSearch)

[Get-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Get-TwitterSavedSearch)

[Remove-TwitterSavedSearch](https://bluebirdps.anovelidea.org/en/latest/Searches/Remove-TwitterSavedSearch)

[Search Standard Operators](https://developer.twitter.com/en/docs/twitter-api/v1/rules-and-filtering/overview/standard-operators)

[Api Reference - POST saved_searches/create](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create)
