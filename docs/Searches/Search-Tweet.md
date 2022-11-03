---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Searches/Search-Tweet
schema: 2.0.0
---

# Search-Tweet

## SYNOPSIS

Returns a collection of relevant Tweets from the last 7 days matching a specified query.

## SYNTAX

```powershell
Search-Tweet [-SearchString] <String> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of relevant Tweets from the last 7 days matching a specified query.

## EXAMPLES

### Example 1

```powershell
PS > Search-Tweet -SearchString '(from:thedavecarroll) (#BluebirdPS)'
```

```text
Id                 : 1395753890352701446
Text               : @mikefrobbins @karlprosser @sunnyc7 @PSHOrg @JeffHicks @PowerTip @Josh_Atwell @ravikanth @ScriptWarrior @SAPIENTech @MaxTrinidad The #PSFollowFriday Tweet brought to you by #BluebirdPS. https://t.co/9ZRyGjusRq
Attachments        : MediaInfo
AuthorId           : 292670084
ContextAnnotations :
ConversationId     : 1395747574317998080
CreatedAt          : 5/21/2021 2:50:33 PM
Entities           : {#PSFollowFriday, #BluebirdPS, @mikefrobbins, @karlprosser…}
Geo                :
InReplyToUserId    : 292670084
Language           : en
NonPublicMetrics   :
OrganicMetrics     :
PossiblySensitive  : False
PromotedMetrics    :
PublicMetrics      : RetweetCount: 0, ReplyCount: 0, LikeCount: 1, QuoteCount: 0
ReferencedTweets   : {1395747574317998080}
ReplySettings      : Everyone
Source             : BluebirdPS
Withheld           :
```

Returns a collection of relevant Tweets matching a specified query.

## PARAMETERS

### -SearchString

The search string consisting of text and Twitter search operators.

```yaml
Type: System.String
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
Default value: 100
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

### -NonPublicMetrics

Include this parameter to display the non-public metrics for returned data.

Note:
Only the authenticating user can request for non-public metrics.

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

### -OrganicMetrics

Include this parameter to display the grouping of public and non-public metrics attributed to an organic context (posted and viewed in a regular manner).

Note:
Only the authenticating user can request for organic metrics.

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

### -PromotedMetrics

Include this parameter to display the grouping of public and non-public metrics attributed to a promoted context (posted or viewed as part of an Ads campaign).

Note:
Only the authenticating user can request for promoted metrics.

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

### BluebirdPS.APIV2.TweetInfo.Tweet[]

## NOTES

Please note that Twitter's search service and, by extension, the Search API is not meant to be an exhaustive source of Tweets.
Not all Tweets will be indexed or made available via the search interface.

To learn how to use Twitter Search effectively, please see the Standard search operators page for a list of available filter operators.

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Searches/Search-Tweet)

[Api Reference - Search Standard Operators](https://developer.twitter.com/en/docs/twitter-api/v1/rules-and-filtering/overview/standard-operators)

[Api Reference - GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent)
