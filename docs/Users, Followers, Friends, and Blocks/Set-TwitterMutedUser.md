---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterMutedUser
schema: 2.0.0
---

# Set-TwitterMutedUser

## SYNOPSIS

Allows the authenticating user to mute or unmute another user.

## SYNTAX

### Mute (Default)

```powershell
Set-TwitterMutedUser -User <User> [-Mute] [<CommonParameters>]
```

### Unmute

```powershell
Set-TwitterMutedUser -User <User> [-Unmute] [<CommonParameters>]
```

## DESCRIPTION

Allows the authenticating user to mute or unmute another user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser -UserName BluebirdPS | Set-TwitterMutedUser
```

Mutes the specified user.

### Example 2

```powershell
PS > Get-TwitterUser -UserName BluebirdPS | Set-TwitterMutedUser -Unmute
```

Unmutes the specified user.

NOTE: If you are not muting the user, an attempt to unmute will result in an error.

## PARAMETERS

### -User

The user object, returned by Get-TwitterUser, to be muted or unmuted.

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

### -Mute

Mute the specified user.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Mute
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unmute

Unmute the specified user.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Unmute
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

### BluebirdPS.APIV2.UserInfo.User

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterMutedUser)

[Get-TwitterMutedUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - POST /2/users/:id/muting](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/post-users-user_id-muting)

[Api Reference - DELETE /2/users/:source_user_id/muting/:target_user_id](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/delete-users-user_id-muting)
