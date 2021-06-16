---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterSavedSearch
schema: 2.0.0
---

# Get-TwitterSavedSearch

## SYNOPSIS

Returns one or all of the authenticating user's saved searches.

## SYNTAX

```powershell
Get-TwitterSavedSearch [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION

Returns one or all of the authenticating user's saved searches.

A user can have up to 25 saved searches.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterSavedSearch
```

```text
Id                  CreatedAt              Name                            Query
--                  ---------              ----                            -----
1316223626610343936 10/13/2020 10:45:41 PM (from:JeffHicks) (#PSTweetChat) (from:JeffHicks) (#PSTweetChat)
1325982551094210566 11/9/2020 8:04:10 PM   (#pwsh_eats)                    (#pwsh_eats)
1332794582241828864 11/28/2020 3:12:45 PM  (#pstweetchat) since:2020-12-04 (#pstweetchat) since:2020-12-04
1382838043116249093 4/15/2021 6:27:36 PM   (#PSHSummit) (since:2021-04-10) (#PSHSummit) (since:2021-04-10)
1392896190300229640 5/13/2021 12:35:05 PM  #PSFollowFriday                 #PSFollowFriday
```

Returns all of the authenticating user's saved searches.

### Example 2

```powershell
PS > Get-TwitterSavedSearch -Id 1316223626610343936
```

```text
Id                  CreatedAt              Name                            Query
--                  ---------              ----                            -----
1316223626610343936 10/13/2020 10:45:41 PM (from:JeffHicks) (#PSTweetChat) (from:JeffHicks) (#PSTweetChat)
```

Returns the authenticating user's specified saved search.

## PARAMETERS

### -Id

The id of the saved search.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### BluebirdPS.APIV1.SavedSearch

### BluebirdPS.APIV1.SavedSearch[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterSavedSearch)

[Add-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Add-TwitterSavedSearch)

[Remove-TwitterSavedSearch](https://docs.bluebirdps.dev/en/v0.6.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Remove-TwitterSavedSearch)

[Api Reference - GET saved_searches/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list)

[Api Reference - GET saved_searches/show/:id](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-show-id)
