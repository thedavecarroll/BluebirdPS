---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version:
schema: 2.0.0
---

# Get-TwitterFollowers

## SYNOPSIS

Returns a collection of user objects or user id that the specified user is following.

## SYNTAX

### Default (Default)

```powershell
Get-TwitterFollowers [-ScreenName <String>] [-UserId <String>] [-ResultsPerPage <Int32>] [<CommonParameters>]
```

### List

```powershell
Get-TwitterFollowers [-ScreenName <String>] [-UserId <String>] [-ResultsPerPage <Int32>] [-List] [-SkipStatus] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of user objects or user id that the specified user is following.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterFollowers -ScreenName thedavecarroll
```

Returns an array of user ids that the specified user is following.

### Example 2

```powershell
PS > Get-TwitterFollowers -List -ScreenName thedavecarroll -SkipStatus -ExcludeEntities
```

Returns a collection of user objects that the specified user is following, excluding the user's last status and the entities.

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

### -ResultsPerPage

Specifies the number of results to retrieve per page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: (All)
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

### -UserId

The ID of the user for whom to return results.

```yaml
Type: String
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

[Api Reference - GET followers/ids](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-ids)
[Api Reference - GET followers/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-list)
