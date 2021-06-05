---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Tweets/Publish-Tweet
schema: 2.0.0
---

# Publish-Tweet

## SYNOPSIS

Publishes a Tweet for the authenticating user.

## SYNTAX

### Tweet (Default)

```powershell
Publish-Tweet [-TweetText] <String> [[-ReplyToTweet] <String>] [[-MediaId] <String[]>] [<CommonParameters>]
```

### TweetWithMedia

```powershell
Publish-Tweet [-TweetText] <String> [[-ReplyToTweet] <String>] -Path <String> -Category <String> [-AltImageText <String>] [<CommonParameters>]
```

## DESCRIPTION

Publishes a Tweet for the authenticating user.

Duplicate Tweets are not allowed, that is to say, a user cannot post the same Tweet twice in a row.

## EXAMPLES

### Example 1

```powershell
PS > Publish-Tweet -TweetText 'Getting an example for documentation for the Publish-Tweet command of the #BluebirdPS #PowerShell 7 module for Twitter.'
```

Publishes the provided text for the authenticating user.

### Example 2

```powershell
PS > Publish-Tweet -TweetText "It took a long time to get this update out. I hope you will find much more useful when working with the Twitter API. #BluebirdPS #PSTweetChat" -ReplyToTweet 1400861303053467650
```

```text
Id                 : 1400862088432599045
Text               : @JeffHicks It took a long time to get this update out. I hope you will find much more useful when working with the Twitter API.
                     #BluebirdPS #PSTweetChat
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1400861303053467650
CreatedAt          : 6/4/2021 5:08:43 PM
Entities           : {Product: Twitter API, #BluebirdPS, #PSTweetChat, @JeffHicks}
Geo                :
InReplyToUserId    : 14478644
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 0, ReplyCount: 0, LikeCount: 0, QuoteCount: 0
ReferencedTweets   : {1400861303053467650}
ReplySettings      : Everyone
Source             : BluebirdPS
Withheld           :
```

Publishes the provided text as a reply to the specified Tweet sfor the authenticating user.

## PARAMETERS

### -TweetText

The text of the Tweet.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: String[]
Parameter Sets: Tweet
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReplyToTweet

The id of an existing Tweet to which the authenticating user wants to reply.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path

Specify the full path to the media file.

```yaml
Type: String
Parameter Sets: TweetWithMedia
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category

Specifies the type and use for the uploaded media.

```yaml
Type: String
Parameter Sets: TweetWithMedia
Aliases:
Accepted values: TweetImage, TweetVideo, TweetGif

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AltImageText

Provide additional information about the images or GIFs.

```yaml
Type: String
Parameter Sets: TweetWithMedia
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

### System.String

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Tweets/Publish-Tweet)

[Get-Tweet](https://docs.bluebirdps.dev/en/v0.5.1/Tweets/Get-Tweet)

[API Documentation - POST statuses/update](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update)
