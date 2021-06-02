---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Tweets/Set-TweetLike
schema: 2.0.0
---

# Set-TweetLike

## SYNOPSIS

Likes or un-likes the specified Tweet as the authenticating user.

## SYNTAX

### Like (Default)

```powershell
Set-TweetLike -Id <String> [-Like] [<CommonParameters>]
```

### Unlike

```powershell
Set-TweetLike -Id <String> [-Unlike] [<CommonParameters>]
```

## DESCRIPTION

Likes or un-likes the specified Tweet as the authenticating user.

The immediately returned Tweet object may not indicate the resultant status of the Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Set-TweetLike -Id 1330354141055643648
```

Like the specified Tweet.

### Example 2

```powershell
PS > Set-TweetLike -Id 1330354141055643648 -Unlike
```

Un-like the specified Tweet.

## PARAMETERS

### -Id

The id of the Tweet.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Like

Like the specified Tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Like
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unlike

Un-like the specified Tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Unlike
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Tweets/Set-TweetLike)

[Get-TweetLike](https://docs.bluebirdps.dev/en/v0.5.0/Tweets/Get-TweetLike)

[API Documentation - POST /2/users/:id/likes](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/post-users-id-likes)

[API Documentation - DELETE /2/users/:id/likes/:tweet_id](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/delete-users-id-likes-tweet_id)
