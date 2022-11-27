---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterBlockedUser
schema: 2.0.0
---

# Set-TwitterBlockedUser

## SYNOPSIS

Allows the authenticating user to block or unblock another user.

## SYNTAX

### Block (Default)

```powershell
Set-TwitterBlockedUser -User <User> [-Block] [<CommonParameters>]
```

### Unblock

```powershell
Set-TwitterBlockedUser -User <User> [-Unblock] [<CommonParameters>]
```

## DESCRIPTION

Allows the authenticating user to block or unblock another user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser -User BluebirdPS | Set-TwitterBlockedUser -Block
```

```text
Blocking user 1330877955057344513: True
```

Block the specified user.

### Example 2

```powershell
PS > Get-TwitterUser -User BluebirdPS | Set-TwitterBlockedUser -Unblock
```

```text
Blocking user 1330877955057344513: False
```

Unblock the specified user.

## PARAMETERS

### -User

The user object, returned by Get-TwitterUser, to be blocked or unblocked.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Block

Block the specified user.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Block
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unblock

Unblock the specified user.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Unblock
Aliases:

Required: True
Position: Named
Default value: False
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterBlockedUser)

[Get-TwitterBlockedUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterBlockedUser)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - POST /2/users/:id/blocking](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/post-users-user_id-blocking)

[Api Reference - DELETE /2/users/:source_user_id/blocking/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/delete-users-user_id-blocking)
