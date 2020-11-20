---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriendship
schema: 2.0.0
---

# Get-TwitterFriendship

## SYNOPSIS

Returns information about the friendships of the authenticating user.

## SYNTAX

### LookupScreenName (Default)

```powershell
Get-TwitterFriendship -ScreenName <String[]> [<CommonParameters>]
```

### LookupUserId

```powershell
Get-TwitterFriendship -UserId <Int32[]> [<CommonParameters>]
```

### ShowScreenName

```powershell
Get-TwitterFriendship -SourceScreenName <String> -TargetScreenName <String> [<CommonParameters>]
```

### ShowUserId

```powershell
Get-TwitterFriendship -SourceUserId <Int32> -TargetUserId <Int32> [<CommonParameters>]
```

### Incoming

```powershell
Get-TwitterFriendship [-Incoming] [<CommonParameters>]
```

### Pending

```powershell
Get-TwitterFriendship [-Pending] [<CommonParameters>]
```

### NoRetweets

```powershell
Get-TwitterFriendship [-NoRetweets] [<CommonParameters>]
```

## DESCRIPTION

Returns information about the friendships of the authenticating user.

The information returned depends on the parameters used.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterFriendship -Pending | ForEach-Object {Get-TwitterUser -UserId $_ | Select-Object -Property screen_name,verified,statuses_count,follow_request_sent,followers_count}
```

```console
screen_name         : AppInsights
verified            : True
statuses_count      : 251
follow_request_sent : True
followers_count     : 805
```

Return a list of pending follow requests and then get information about the Twitter users that have been requested to be followed.

## PARAMETERS

### -Incoming

Returns an array of user ids for every user who has requested to follow the authenticating user.

```yaml
Type: SwitchParameter
Parameter Sets: Incoming
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoRetweets

Returns an array of user ids that the authenticating user does not want to receive retweets from.

```yaml
Type: SwitchParameter
Parameter Sets: NoRetweets
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pending

Returns an array of user ids for every protected user for whom the authenticating user has a pending follow request.

```yaml
Type: SwitchParameter
Parameter Sets: Pending
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
Type: String[]
Parameter Sets: LookupScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: Int32[]
Parameter Sets: LookupUserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SourceScreenName

The screen name of the source user for whom to return results.

```yaml
Type: String
Parameter Sets: ShowScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceUserId

The ID of the target user for whom to return results.

```yaml
Type: Int32
Parameter Sets: ShowUserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetScreenName

The screen name of the target user for whom to return results.

```yaml
Type: String
Parameter Sets: ShowScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetUserId

The ID of the target user for whom to return results.

```yaml
Type: Int32
Parameter Sets: ShowUserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

### System.Int32[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriendship)
[Get-TwitterFriends](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriends)
[Get-TwitterFollowers](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFollowers)

[Api Reference - GET friendships/incoming](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming)
[Api Reference - GET friendships/no_retweets/ids](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-no_retweets-ids)
[Api Reference - GET friendships/lookup](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup)
[Api Reference - GET friendships/outgoing](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing)
[Api Reference - GET friendships/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show)
