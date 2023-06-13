---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterPinnedList/
schema: 2.0.0
---

# Get-TwitterPinnedList

## SYNOPSIS

Returns the Lists pinned by the authenticating user.

## SYNTAX

```powershell
Get-TwitterPinnedList [<CommonParameters>]
```

## DESCRIPTION

Returns the Lists pinned by the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterPinnedList
```

Returns the Lists pinned by the authenticating user.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.APIV2.ListInfo.List

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterPinnedList)

[Set-TwitterPinnedList](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Set-TwitterPinnedList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList)

[Api Reference - GET /2/users/:id/pinned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/get-users-id-pinned_lists)
