---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser
schema: 2.0.0
---

# Get-TwitterMutedUser

## SYNOPSIS

Returns a collection of user objects or array of user ids that the authenticating user has muted.

## SYNTAX

### __AllParameterSets

```powershell
Get-TwitterMutedUser [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of user objects or array of user ids that the authenticating user has muted.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterMutedUser
```

Returns a list of user ids the authenticating user has muted.

### Example 2

```powershell
PS > Get-TwitterMutedUser | Get-TwitterUser
```

Use the list of user ids the authenticating user has muted as input for Get-TwitterUser.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser)

[Set-TwitterMutedUser](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterMutedUser)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[API Documentation - GET mutes/users/ids](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids)
