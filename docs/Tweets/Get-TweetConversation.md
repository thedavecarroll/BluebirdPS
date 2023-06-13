---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TweetConversation
schema: 2.0.0
---

# Get-TweetConversation

## SYNOPSIS

This command returns the original Tweet and any Tweets that were part of the conversation/thread.

## SYNTAX

### ById (Default)

```powershell
Get-TweetConversation -Id <String> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [<CommonParameters>]
```

### ByTweet

```powershell
Get-TweetConversation -Tweet <Tweet> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics] [<CommonParameters>]
```

## DESCRIPTION

This command returns the original Tweet and any Tweets that were part of the conversation/thread.

## EXAMPLES

### Example 1

```powershell
PS > Get-TweetConversation -Id 1587370017565429760 | Format-Table -Property Id,CreatedAt,AuthorId -AutoSize
```

```text
Id                  CreatedAt             AuthorId
--                  ---------             --------
1587370017565429760 11/1/2022 9:04:38 AM  2993481
1587561286606397441 11/1/2022 9:44:40 PM  19965407
1587515965377347584 11/1/2022 6:44:35 PM  792360012
1587468671970066439 11/1/2022 3:36:39 PM  3467737234
1587445159029100546 11/1/2022 2:03:13 PM  97056057
1587439140052037632 11/1/2022 1:39:18 PM  2993481
1587438471718862848 11/1/2022 1:36:39 PM  2993481
1587434432432115713 11/1/2022 1:20:36 PM  97056057
1587432541769842689 11/1/2022 1:13:05 PM  827673195746570241
1587430131748028417 11/1/2022 1:03:31 PM  126812846
1587408225166659584 11/1/2022 11:36:28 AM 15106967
1587404144087912448 11/1/2022 11:20:15 AM 2993481
1587382983417335809 11/1/2022 9:56:10 AM  25658337
1587370205050806272 11/1/2022 9:05:23 AM  2993481
```

Return the tweets within the provided conversation.

## PARAMETERS

### -Id

The ID of the Tweet to retrieve

```yaml
Type: System.String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Tweet

A Tweet object returned by a command directly or as part of the included objects of a User object.

```yaml
Type: BluebirdPS.APIV2.TweetInfo.Tweet
Parameter Sets: ByTweet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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
Default value: None
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

### BluebirdPS.APIV2.TweetInfo.Tweet

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet

### BluebirdPS.APIV2.UserInfo.User

### BluebirdPS.APIV2.MediaInfo.Media

### BluebirdPS.APIV2.Objects.Poll

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TweetConversation)

[Api Reference - GET /2/tweets/search/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/search/api-reference/get-tweets-search-recent)

[Api Reference - Conversation ID](https://developer.twitter.com/en/docs/twitter-api/conversation-id)
