---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Tweets/Get-Tweet
schema: 2.0.0
---

# Get-Tweet

## SYNOPSIS

Returns one or more Tweets, or a Tweet conversation.

## SYNTAX

### Tweet (Default)

```powershell
Get-Tweet [-Id] <String[]> [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [-IncludeExpansions] [<CommonParameters>]
```

### Conversation

```powershell
Get-Tweet [-ConversationId] <String> [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [-IncludeExpansions] [<CommonParameters>]
```

## DESCRIPTION

Returns one or more Tweets, or a Tweet conversation.

## EXAMPLES

### Example 1

```powershell
PS >  Get-Tweet -Id 1306447142052155394
```

```text
Id                 : 1306447142052155394
Text               : In the #PSConfBook, Vol 3, you'll find 22 chapters containing great information on using #PowerShell for systems management, in #DevOps practices, and some tips and tricks.

                     Slide to the right to increase your support of @DevOpsOrg #OnRampScholarships.

                     https://t.co/c5JlxW9K9b
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1306447142052155394
CreatedAt          : 9/17/2020 4:17:25 AM
Entities           : {#PSConfBook, #PowerShell, #DevOps, #OnRampScholarships…}
Geo                :
InReplyToUserId    :
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 9, ReplyCount: 0, LikeCount: 11, QuoteCount: 2
ReferencedTweets   :
ReplySettings      : Everyone
Source             : Twitter for iPhone
Withheld           :
```

Returns the Tweet specified by the Id.

### Example 2

```powershell
PS >  Get-Tweet -Id 1306447142052155394 -IncludeExpansions
```

```text
Id                 : 1306447142052155394
Text               : In the #PSConfBook, Vol 3, you'll find 22 chapters containing great information on using #PowerShell for systems management, in #DevOps practices, and some tips and tricks.

                     Slide to the right to increase your support of @DevOpsOrg #OnRampScholarships.

                     https://t.co/c5JlxW9K9b
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1306447142052155394
CreatedAt          : 9/17/2020 4:17:25 AM
Entities           : {#PSConfBook, #PowerShell, #DevOps, #OnRampScholarships…}
Geo                :
InReplyToUserId    :
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 9, ReplyCount: 0, LikeCount: 11, QuoteCount: 2
ReferencedTweets   :
ReplySettings      : Everyone
Source             : Twitter for iPhone
Withheld           :

Id              : 292670084
Name            : Dave Carroll
UserName        : thedavecarroll
CreatedAt       : 5/4/2011 1:22:46 AM
Description     : Married to an amazing woman. #PowerShell #Blogger #RushTheBand #RetroComputing #Puns #Doggos #Tech #StarTrek #INTJ https://t.co/fLbRHoxt39
Entities        : {https://powershell.anovelidea.org/, https://pronoun.is/he}
Location        : Nashville, TN
PinnedTweetId   : 1385709814890864648
ProfileImageUrl : https://pbs.twimg.com/profile_images/1332944757186760704/s4AjaIMg_normal.jpg
Protected       : False
PublicMetrics   : FollowersCount: 945, FollowingCount: 1653, ListedCount: 27, TweetCount: 6470
Url             : https://t.co/G5ojwP677I
Verified        : False
Withheld        :

Id              : 4705903393
Name            : DevOps Collective
UserName        : DevOpsOrg
CreatedAt       : 1/3/2016 11:29:09 PM
Description     : Education and more for the Ops side of the DevOps world
Entities        : {http://devopscollective.org/}
Location        :
PinnedTweetId   :
ProfileImageUrl : https://pbs.twimg.com/profile_images/1148661591661039623/6pIYwPt0_normal.jpg
Protected       : False
PublicMetrics   : FollowersCount: 692, FollowingCount: 19, ListedCount: 5, TweetCount: 137
Url             : https://t.co/Mn3cXPzLUU
Verified        : False
Withheld        :
```

Returns the Tweet specified by the Id and include any expansions.

### Example 3

```powershell
PS >  Get-Tweet -ConversationId 1398279333823791104
```

```text
Id                 : 1398279333823791104
Text               : For today's #PowerShell #PSFollowFriday, I've pulled a random sample from @adouwes's Twitter List, Powershell.
                     https://t.co/vda8MBo2wi

                     @Steve_MSFT @JeremyMurrah @BrettMiller_IT @Jaap_Brasser @sydneysmithreal @PowerShellMag @devblackops @thenextdotnet @MikeShepard70 @nohwnd
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1398279333823791104
CreatedAt          : 5/28/2021 2:05:46 PM
Entities           : {Product: Twitter, #PowerShell, #PSFollowFriday, @adouwes…}
Geo                :
InReplyToUserId    :
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 4, ReplyCount: 1, LikeCount: 6, QuoteCount: 0
ReferencedTweets   :
ReplySettings      : Everyone
Source             : BluebirdPS
Withheld           :

Id                 : 1398314780088180737
Text               : @thedavecarroll @adouwes @Steve_MSFT @JeremyMurrah @BrettMiller_IT @Jaap_Brasser @sydneysmithreal @PowerShellMag @devblackops @thenextdotnet @MikeShepard70 @nohwnd @TwitterAPI @juneb_get_help That is great guidance. I also like having the last one of them be my copy/paste ready example for how I use it most.
Attachments        :
AuthorId           : 22186737
ContextAnnotations :
ConversationId     : 1398279333823791104
CreatedAt          : 5/28/2021 4:26:37 PM
Entities           : {@thedavecarroll, @adouwes, @Steve_MSFT, @JeremyMurrah…}
Geo                :
InReplyToUserId    : 292670084
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 0, ReplyCount: 0, LikeCount: 1, QuoteCount: 0
ReferencedTweets   : {1398295097490477059}
ReplySettings      : Everyone
Source             : Twitter for Android
Withheld           :

Id                 : 1398298293839532036
Text               : @thedavecarroll @adouwes @Steve_MSFT @JeremyMurrah @BrettMiller_IT @Jaap_Brasser @sydneysmithreal @PowerShellMag @devblackops @thenextdotnet @MikeShepard70 @nohwnd @TwitterAPI @juneb_get_help St June's advice is always good.
Attachments        :
AuthorId           : 14150382
ContextAnnotations :
ConversationId     : 1398279333823791104
CreatedAt          : 5/28/2021 3:21:07 PM
Entities           : {@thedavecarroll, @adouwes, @Steve_MSFT, @JeremyMurrah…}
Geo                :
InReplyToUserId    : 292670084
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 0, ReplyCount: 0, LikeCount: 1, QuoteCount: 0
ReferencedTweets   : {1398295097490477059}
ReplySettings      : Everyone
Source             : TweetDeck
Withheld           :

Id                 : 1398295097490477059
Text               : @adouwes @Steve_MSFT @JeremyMurrah @BrettMiller_IT @Jaap_Brasser @sydneysmithreal @PowerShellMag @devblackops @thenextdotnet @MikeShepard70 @nohwnd @TwitterAPI When writing #PowerShell command documenation, I try to follow @juneb_get_help's suggestions (see  https://t.co/VTtQoodH0t). This has the benefit of validating the commands, and I've had to track down some bugs discovered.
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1398279333823791104
CreatedAt          : 5/28/2021 3:08:24 PM
Entities           : {#PowerShell, @adouwes, @Steve_MSFT, @JeremyMurrah…}
Geo                :
InReplyToUserId    : 292670084
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 2, ReplyCount: 2, LikeCount: 7, QuoteCount: 1
ReferencedTweets   : {1398284726721564679}
ReplySettings      : Everyone
Source             : BluebirdPS
Withheld           :

Id                 : 1398284726721564679
Text               : @adouwes @Steve_MSFT @JeremyMurrah @BrettMiller_IT @Jaap_Brasser @sydneysmithreal @PowerShellMag @devblackops @thenextdotnet @MikeShepard70 @nohwnd Here is the function that I'm using to generate the #PSFollowFriday list, https://t.co/3t20xEAGIi. It requires the upcoming #BluebirdPS 0.5.0 release. I'm finalizing the documentation; with 62 public commands and support for the @TwitterAPI V2, there's a lot to write!
Attachments        :
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1398279333823791104
CreatedAt          : 5/28/2021 2:27:12 PM
Entities           : {#PSFollowFriday, #BluebirdPS, @adouwes, @Steve_MSFT…}
Geo                :
InReplyToUserId    : 292670084
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 0, ReplyCount: 1, LikeCount: 1, QuoteCount: 0
ReferencedTweets   : {1398279333823791104}
ReplySettings      : Everyone
Source             : BluebirdPS
Withheld           :
```

Searches for Tweets with the specified ConversationId.

## PARAMETERS

### -Id

One or more Tweet id's to return.

```yaml
Type: String[]
Parameter Sets: Tweet
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConversationId

The id of the Tweet that initiated the conversation you wish to retrieve.

You will be notified if you attempt to retrieve a conversation that started more than 7 days ago.

```yaml
Type: String
Parameter Sets: Conversation
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeExpansions

Include additional data objects, such as the Tweet author's user, mentioned users, media, poll, and more.

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

### -NonPublicMetrics

Include non-public engagement metrics for the Tweet at the time of the request.

NonPublic metrics include ImpressionCount, UrlLinkClicks, and UserProfileClicks.

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

### -OrganicMetrics

Include engagement metrics, tracked in an organic context, for the Tweet at the time of the request.

OrganicMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

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

### -PromotedMetrics

Include engagement metrics, tracked in a promoted context, for the Tweet at the time of the request.

PromotedMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

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

### System.String

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet

### BluebirdPS.APIV2.TweetInfo.Tweet[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Tweets/Get-Tweet)

[Api Reference - Conversation Id](https://developer.twitter.com/en/docs/twitter-api/conversation-id)

[Api Reference - GET /2/tweets/:id](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets-id)

[Api Reference - GET /2/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets)

[Api Reference - GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent)
