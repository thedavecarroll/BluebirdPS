---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Remove-TwitterFriend
schema: 2.0.0
---

# Remove-TwitterFriend

## SYNOPSIS

Allows the authenticating user to unfollow another Twitter user.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterFriend -Id <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByUser

```powershell
Remove-TwitterFriend -User <User> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Allows the authenticating user to unfollow another Twitter user.

## EXAMPLES

### Example 1

```powershell
PS >  Remove-TwitterFriend -Id 1330877955057344513
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Unfollow user" on target "1330877955057344513".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
Following user 1330877955057344513: False.
```

Unfollow the specified user.

### Example 2

```powershell
PS >  Get-TwitterFriend -UserName BluebirdPS | Remove-TwitterFriend
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Unfollow user" on target "1330877955057344513".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
Following user 1330877955057344513: False.
```

Unfollow the specified user.

## PARAMETERS

### -Id

Specifies the id of the user to unfollow.

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

The user object, returned by Get-TwitterUser, to be unfollowed.

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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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

### System.String

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Remove-TwitterFriend)

[Add-TwitterFriend](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Add-TwitterFriend)

[Get-TwitterFriends](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriends)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.7.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - DELETE /2/users/:source_user_id/following/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/delete-users-source_id-following)
