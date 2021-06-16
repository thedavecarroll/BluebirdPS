---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Add-TwitterFriend
schema: 2.0.0
---

# Add-TwitterFriend

## SYNOPSIS

Allows the authenticating user to follow another Twitter user.

## SYNTAX

### ById (Default)

```powershell
Add-TwitterFriend -Id <String> [<CommonParameters>]
```

### ByUser

```powershell
Add-TwitterFriend -User <User> [<CommonParameters>]
```

## DESCRIPTION

Allows the authenticating user to follow another Twitter user.

If the target user does not have public Tweets, this endpoint will send a follow request.

## EXAMPLES

### Example 1

```powershell
PS > Add-TwitterFriend -Id 1330877955057344513
```

```text
Following user 1330877955057344513: True.
```

Follow the user with the specified id.

### Example 2

```powershell
PS > Get-TwitterFriend -UserName BluebirdPS | Add-TwitterFriend
```

```text
Following user 1330877955057344513: True.
```

Follow the user returned by Get-TwitterUser.

## PARAMETERS

### -Id

Specifies the id of the user to follow.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

The user object, returned by Get-TwitterUser, to follow.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV2.UserInfo.User

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Add-TwitterFriend)

[Remove-TwitterFriend](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Remove-TwitterFriend)

[Get-TwitterFriends](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriends)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - POST /2/users/:id/following](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/post-users-source_user_id-following)
