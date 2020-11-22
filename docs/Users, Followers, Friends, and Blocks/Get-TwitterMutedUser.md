---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser
schema: 2.0.0
---

# Get-TwitterMutedUser

## SYNOPSIS

Returns a collection of user objects or array of user ids that the authenticating user has muted.

## SYNTAX

### Default (Default)

```powershell
Get-TwitterMutedUser [<CommonParameters>]
```

### List

```powershell
Get-TwitterMutedUser [-List] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
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
PS > Get-TwitterMutedUser
```

Returns a list of user ids the authenticating user has muted.

## PARAMETERS

### -List

By using this switch, this command will return user objects instead of an array of user ids.

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipStatus

Exclude the user statuses from the returned user objects.

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases:

Required: False
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
Parameter Sets: List
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser)

[API Documentation - GET mutes/users/ids](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids)

[API Documentation - GET mutes/users/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list)
