---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterAccountSettings
schema: 2.0.0
---

# Get-TwitterAccountSettings

## SYNOPSIS

Returns the settings for the authenticating user.

## SYNTAX

```powershell
Get-TwitterAccountSettings [<CommonParameters>]
```

## DESCRIPTION

Returns the settings for the authenticating user.

This includes current trend, geo and sleep time information.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterAccountSettings
```

Returns the settings for the authenticating user.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.APIV1.AccountSettings

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterAccountSettings)

[Api Reference - GET account/settings](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-account-settings)
