---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Tweets/Get-Tweet
schema: 2.0.0
---

# Get-Tweet

## SYNOPSIS

Returns one or more Tweets.

## SYNTAX

```powershell
Get-Tweet [-Id] <String[]> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [<CommonParameters>]
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

## PARAMETERS

### -Id

One or more Tweet id's to return.

```yaml
Type: System.String[]
Parameter Sets: (All)
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
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonPublicMetrics

Include non-public engagement metrics for the Tweet at the time of the request.

NonPublic metrics include ImpressionCount, UrlLinkClicks, and UserProfileClicks.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrganicMetrics

Include engagement metrics, tracked in an organic context, for the Tweet at the time of the request.

OrganicMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PromotedMetrics

Include engagement metrics, tracked in a promoted context, for the Tweet at the time of the request.

PromotedMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxResultsPerPage

The maximum number of results to be return by each page of the request.

Note:
By default, this command will request all available pages of data with each page request counting against the rate limit threshold.

You can force the command only return a single page with the NoPagination switch.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoPagination

Only return the first page of data for the request.

Note:
By default, this command will request all available pages of data with each page request counting against the rate limit threshold.

```yaml
Type: System.Management.Automation.SwitchParameter
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Tweets/Get-Tweet)

[Api Reference - GET /2/tweets/:id](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets-id)

[Api Reference - GET /2/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/lookup/api-reference/get-tweets)

[Api Reference - GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent)
