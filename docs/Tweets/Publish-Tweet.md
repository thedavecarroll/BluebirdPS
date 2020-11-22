---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Tweets/Publish-Tweet
schema: 2.0.0
---

# Publish-Tweet

## SYNOPSIS

Publishes a tweet for the authenticating user.

## SYNTAX

### Default (Default)

```powershell
Publish-Tweet [-TweetText] <String> [[-MediaId] <Object[]>] [<CommonParameters>]
```

### Reply

```powershell
Publish-Tweet [-TweetText] <String> [[-ReplyToTweeet] <Int64>] [[-MediaId] <Object[]>] [<CommonParameters>]
```

## DESCRIPTION

Publishes a tweet for the authenticating user.

Duplicate tweets are not allowed, that is to say, a user cannot post the same tweet twice in a row.

## EXAMPLES

### Example 1

```powershell
PS > Publish-Tweet -TweetText 'Getting an example for documentation for the Publish-Tweet command of the #BluebirdPS #PowerShell 7 module for Twitter.'
```

Publishes the provided text for the authenticating user.

### Example 2

```powershell
PS > Publish-Tweet -TweetText 'The Publish-Tweet command of the #BluebirdPS #PowerShell 7 module for Twitter can also reply to a tweet unless I have a silly typo in the definition. ¯\_(ツ)_/¯' -ReplyToTweet 1330354141055643648 -MediaId 1330355920799412226
```

```console
created_at                : Sun Nov 22 03:47:42 +0000 2020
id                        : 1330357261626208258
id_str                    : 1330357261626208258
text                      : The Publish-Tweet command of the #BluebirdPS #PowerShell 7 module for Twitter can also reply to a tweet unless I ha… https://t.co/Kz6qAA0fNb
truncated                 : True
entities                  : @{hashtags=System.Object[]; symbols=System.Object[]; user_mentions=System.Object[]; urls=System.Object[]}
source                    : <a href="https://powershell.anovelidea.org" rel="nofollow">thedavecarrroll-tweets-with-pwsh</a>
in_reply_to_status_id     : 1330354141055643648
in_reply_to_status_id_str : 1330354141055643648
in_reply_to_user_id       : 292670084
in_reply_to_user_id_str   : 292670084
in_reply_to_screen_name   : thedavecarroll
<TRUNCATED OUTPUT>
```

Publishes the provided text as a reply with the specified media for the authenticating user.

## PARAMETERS

### -TweetText

The text of the tweet.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReplyToTweet

The id of an existing tweet to which the authenticating user wants to reply.

```yaml
Type: Int64
Parameter Sets: Reply
Aliases:

Required: False
Position: 1
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Tweets/Publish-Tweet)

[Get-Tweet](https://bluebirdps.anovelidea.org/en/latest/Tweets/Get-Tweet)

[Set-TweetLike](https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike)

[API Documentation - POST statuses/update](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update)
