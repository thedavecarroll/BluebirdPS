---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriends
schema: 2.0.0
---

# Get-TwitterFriends

## SYNOPSIS

Returns a collection of Twitter users that e specified user follows.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterFriends [-Id <String>] [-IncludeExpansions] [<CommonParameters>]
```

### ByUser

```powershell
Get-TwitterFriends -User <User> [-IncludeExpansions] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of Twitter users that e specified user follows.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterFriends
```

Returns the users followed by the authenticating user.

### Example 2

```powershell
PS > Get-TwitterFriends -Id 1330877955057344513
```

Returns the users followed by the specified user.

### Example 3

```powershell
PS > Get-TwitterUser -User BluebirdPS | Get-TwitterFriends
```

Returns the users followed by the user returned by Get-TwitterUser.

## PARAMETERS

### -Id

Return a list of users followed by the user, as specified by the id.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

Return a list of users followed by the user, as specified by the user object returned by Get-TwitterUser.

```yaml
Type: User
Parameter Sets: ByUser
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Include the pinned Tweet for the returned user(s).

```yaml
Type: SwitchParameter
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

### BluebirdPS.APIV2.UserInfo.User

## OUTPUTS

### BluebirdPS.APIV2.UserInfo.User

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriends)

[Add-TwitterFriend](https://docs.bluebirdps.dev/en/v0.5.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Add-TwitterFriend)

[Remove-TwitterFriend](https://docs.bluebirdps.dev/en/v0.5.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Remove-TwitterFriend)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.5.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - GET /2/users/:id/following](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-following)
