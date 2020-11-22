---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser
schema: 2.0.0
---

# Get-TwitterUser

## SYNOPSIS

Returns a variety of information about the specified user.

## SYNTAX

### ScreenName

```powershell
Get-TwitterUser -ScreenName <String> [-ExcludeEntities] [<CommonParameters>]
```

### UserId

```powershell
Get-TwitterUser -UserId <String> [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns a variety of information about the specified user.

The author's most recent Tweet will be returned inline when possible.

You must be following a protected user to be able to see their most recent Tweet.
If you don't follow a protected user, the user's Tweet will be removed.
A Tweet will not always be returned in the current_status field.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser -ScreenName thedavecarroll
```

Returns details about the specified user.

## PARAMETERS

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: ScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: String
Parameter Sets: UserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeEntities

Exclude the entities node.

This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags.

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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Get-TwitterUserList](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUserList)

[API Documentation - GET users/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list)
