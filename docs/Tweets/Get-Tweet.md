---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Get-Tweet
schema: 2.0.0
---

# Get-Tweet

## SYNOPSIS

Returns a single Tweet, specified by the TweetId parameter. The Tweet's author will also be embedded within the Tweet.

## SYNTAX

```powershell
Get-Tweet [-TweetId] <Int64> [<CommonParameters>]
```

## DESCRIPTION

Returns a single Tweet, specified by the TweetId parameter. The Tweet's author will also be embedded within the Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Get-Tweet -TweetId 1306447142052155394

created_at                    : Thu Sep 17 04:17:25 +0000 2020
id                            : 1306447142052155394
id_str                        : 1306447142052155394
text                          : In the #PSConfBook, Vol 3, you'll find 22 chapters containing great information on using #PowerShell for systems ma… https://t.co/e2rH22110h
truncated                     : True
entities                      : @{hashtags=System.Object[]; symbols=System.Object[]; user_mentions=System.Object[]; urls=System.Object[]}
source                        : <a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>
in_reply_to_status_id         :
in_reply_to_status_id_str     :
in_reply_to_user_id           :
in_reply_to_user_id_str       :
in_reply_to_screen_name       :
user                          : @{id=292670084; id_str=292670084; name=Dave Carroll; screen_name=thedavecarroll;
                                <truncated>
geo                           :
coordinates                   :
place                         :
contributors                  :
is_quote_status               : False
retweet_count                 : 8
favorite_count                : 10
favorited                     : False
retweeted                     : True
possibly_sensitive            : False
possibly_sensitive_appealable : False
lang                          : en
```

Return the tweet with TweetId 1306447142052155394.

## PARAMETERS

### -TweetId

The numerical ID of the desired Tweet.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Int64

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Get-Tweet)
[Publish-Tweet](https://bluebirdps.anovelidea.org/en/latest/Publish-Tweet)
[Set-TweetLike](https://bluebirdps.anovelidea.org/en/latest/Set-TweetLike)
[API Documentation](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id)
