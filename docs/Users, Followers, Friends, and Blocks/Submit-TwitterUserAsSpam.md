---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Submit-TwitterUserAsSpam
schema: 2.0.0
---

# Submit-TwitterUserAsSpam

## SYNOPSIS

Report the specified user as a spam account to Twitter.

## SYNTAX

```powershell
Submit-TwitterUserAsSpam [-UserName] <String> [-Id <String>] [-Block] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Report the specified user as a spam account to Twitter.

You can opt to block the user by using the Block switch parameter.

If you want to verify that you have reported a user, you can use the Get-TwitterFriendship command.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser -User rossxhype | Submit-TwitterUserAsSpam
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Report as Spam" on target "rossxhype, CreatedAt: 10/17/2015 4:42:02 AM, Description: ********".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Report the specified user as spam.

### Example 2

```powershell
PS > Get-TwitterUser -User ihezoyetahek | Submit-TwitterUserAsSpam -Block
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Report as Spam and Block" on target "ihezoyetahek, CreatedAt: 10/14/2015 11:41:01 PM, Description: ********".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Report the specified user as spam as well as block them.

## PARAMETERS

### -User

The user object, returned by Get-TwitterUser, to report as spam, and optionally block.

```yaml
Type: User
Parameter Sets: UnblockByUser, BlockByUser
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Block

Indicates to block the specified user, at the same time as reporting them as spam.

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

### BluebirdPS.APIV2.UserInfo.User

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Submit-TwitterUserAsSpam)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Get-TwitterFriendship](https://docs.bluebirdps.dev/en/v0.6.1/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriendship)

[Api Reference - POST users/report_spam](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam)
