---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriendship
schema: 2.0.0
---

# Get-TwitterFriendship

## SYNOPSIS

Returns information about the friendships of the authenticating user or a source user and target user.

## SYNTAX

### Lookup (Default)

```powershell
Get-TwitterFriendship -UserName <String[]> [<CommonParameters>]
```

### Show

```powershell
Get-TwitterFriendship -SourceUserName <String> -TargetUserName <String> [<CommonParameters>]
```

### Pending

```powershell
Get-TwitterFriendship [-Pending] [<CommonParameters>]
```

### Incoming

```powershell
Get-TwitterFriendship [-Incoming] [<CommonParameters>]
```

### NoRetweets

```powershell
Get-TwitterFriendship [-NoRetweets] [<CommonParameters>]
```

## DESCRIPTION

Returns information about the friendships of the authenticating user or a source user and target user.

Suspended users are filtered out after connections are queried.

The information returned depends on the parameters used.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterFriendship -UserName BluebirdPS,newsbreakApp,AutoOverload,SportsCenter,AppInsights
```

```text
UserName     Id                  Connections
--------     --                  -----------
BluebirdPS   1330877955057344513 {Following, FollowedBy}
newsbreakApp 4127951894          {Blocking}
AutoOverload 2896222807          {Muting}
SportsCenter 26257166            {None}
AppInsights  4036841419          {FollowingRequested}
```

Providing one or more user names to return connection information between the authenticating user and the specified user(s).

### Example 2

```powershell
PS > $Friendship = Get-TwitterFriendship -SourceUserName thedavecarroll -TargetUserName BillGates
PS > $Friendship
PS > $Friendship.Source
PS > $Friendship.Target
```

```text
# Output for $Friendship
Source                                                         Target
------                                                         ------
thedavecarroll : Following, NotificationsEnabled, WantRetweets BillGates : FollowedBy

# Output for $Friendship.Source
Id                   : 292670084
UserName             : thedavecarroll
Following            : True
FollowedBy           : False
LiveFollowing        : False
FollowingReceived    : False
FollowingRequested   : False
NotificationsEnabled : True
CanDM                : False
Blocking             : False
BlockedBy            : False
Muting               : False
WantRetweets         : True
AllReplies           : False
MarkedSpam           : False

# Output for $Friendship.Target
Id                 : 50393960
UserName           : BillGates
Following          : False
FollowedBy         : True
FollowingReceived  : False
FollowingRequested : False
```

Returns detailed information about the relationship between two users.

### Example 3

```powershell
PS > Get-TwitterFriendship -Incoming | Get-TwitterUser
```

Return a list user ids of incoming follow requests and then get information about the Twitter users that have requested to follow the authenticating user.

If the authenticating user's Tweets are not protected, the command with the Incoming switch will return 0 results.

### Example 4

```powershell
PS > Get-TwitterFriendship -Pending
```

Return a list user ids of outgoing follow requests.

### Example 5

```powershell
PS > Get-TwitterFriendship -NoRetweets
```

Return a list user ids that the authenticating user does not want to see Retweets from.

## PARAMETERS

### -UserName

One or more user names to return the connection details.

Connections can be: Following, FollowingRequested, FollowedBy, Blocking, Muting, or None.

```yaml
Type: System.String[]
Parameter Sets: Lookup
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SourceUserName

Specifies the source user to return detailed information about the relationship with the target user.

```yaml
Type: System.String
Parameter Sets: Show
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetUserName

Specifies the target user to return detailed information about the relationship with the source user.

```yaml
Type: System.String
Parameter Sets: Show
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Incoming

Returns an array of user ids for every user who has requested to follow the authenticating user, if their Tweets are private.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Incoming
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pending

Returns an array of user ids for every protected user for whom the authenticating user has a pending follow request.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Pending
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoRetweets

Returns an array of user ids that the authenticating user does not want to receive retweets from.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: NoRetweets
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### BluebirdPS.APIV1.FriendshipConnections

### BluebirdPS.APIV1.Relationship

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFriendship)

[Api Reference - GET friendships/lookup](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup)

[Api Reference - GET friendships/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show)

[Api Reference - GET friendships/outgoing](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing)

[Api Reference - GET friendships/incoming](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming)

[Api Reference - GET friendships/no_retweets/ids](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-no_retweets-ids)
