---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike
schema: 2.0.0
---

# Set-TweetLike

## SYNOPSIS

Likes or un-likes the specified tweet as the authenticating user.

## SYNTAX

### Like (Default)

```powershell
Set-TweetLike -TweetId <Int64> [-Like] [-ExcludeEntities] [<CommonParameters>]
```

### Unlike

```powershell
Set-TweetLike -TweetId <Int64> [-Unlike] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Likes or un-likes the specified tweet as the authenticating user.

The immediately returned Tweet object may not indicate the resultant status of the Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Set-TweetLike -TweetId 1330354141055643648
```

Like the specified tweet.

### Example 2

```powershell
PS > Set-TweetLike -TweetId 1330354141055643648 -Unlike
```

Un-like the specified tweet.

## PARAMETERS

### -TweetId

The numerical ID of the desired Tweet.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: Id)

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Like

Like the specified tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Like
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unlike

Un-like the specified tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Unlike
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike)

[Get-TweetLike](https://bluebirdps.anovelidea.org/en/latest/Tweets/Get-TweetLike)

[API Documentation - POST favorites/create](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-create)

[API Documentation - POST favorites/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy)
