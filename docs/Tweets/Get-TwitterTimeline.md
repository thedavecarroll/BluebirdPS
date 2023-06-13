---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TwitterTimeline
schema: 2.0.0
---

# Get-TwitterTimeline

## SYNOPSIS

Returns Tweets composed by the specified user or that mention the specified user.

## SYNTAX

### User (Default)

```powershell
Get-TwitterTimeline -User <User> [-Exclude <String[]>] [-StartTime <DateTime>] [-EndTime <DateTime>]
 [-SinceId <String>] [-UntilId <String>] [-IncludeExpansions] [-NonPublicMetrics] [-PromotedMetrics]
 [-OrganicMetrics] [-MaxResultsPerPage <Int32>] [-NoPagination] [<CommonParameters>]
```

### Mentions

```powershell
Get-TwitterTimeline -User <User> [-Mentions] [-StartTime <DateTime>] [-EndTime <DateTime>] [-SinceId <String>]
 [-UntilId <String>] [-IncludeExpansions] [-NonPublicMetrics] [-PromotedMetrics] [-OrganicMetrics]
 [-MaxResultsPerPage <Int32>] [-NoPagination] [<CommonParameters>]
```

## DESCRIPTION

Returns Tweets composed by the specified user or that mention the specified user.

You can retrieve the most recent Tweets with maximum of 3200 composed by the user or 800 mentioning the user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser | Get-TwitterTimeline
```

Return the Tweet timeline for the authenticating user.

### Example 2

```powershell
PS > Get-TwitterUser -User TwitterDev | Get-TwitterTimeline -Mentions
```

Return the Tweet timeline for the specified user.

### Example 3

```powershell
PS > Get-TwitterUser -User TwitterDev | Get-TwitterTimeline -StartTime (Get-Date '01/01/2020') -EndTime (Get-Date '12/31/2020') -Exclude Retweets,Replies
```

Return the Tweet timeline for the specified user for Tweets composed during the year 2020 and excluding any retweets and replies.

### Example 4

```powershell
PS > Get-TwitterUser -User TwitterApi | Get-TwitterTimeline -SinceId 1394657341472088066
```

Return the Tweet timeline for the specified user for Tweets composed after the specified Tweet Id.

## PARAMETERS

### -User

The user object, returned by Get-TwitterUser, to retrieve the Tweet timeline or mention timeline.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Exclude

Exclude Retweets, Replies, or both from the results.

NOTE: If you exclude Replies, only the most recent 800 Tweets are returned.

```yaml
Type: System.String[]
Parameter Sets: User
Aliases:
Accepted values: Retweets, Replies

Required: False
Position: Named
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

### -Mentions

Specifies to retrieve Tweets that mention the specified user.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Mentions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonPublicMetrics

Include non-public engagement metrics for the Tweet at the time of the request.

NonPublicMetrics include ImpressionCount, UrlLinkClicks, and UserProfileClicks.

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

### -StartTime

The oldest or earliest timestamp from which the Tweets will be provided.

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndTime

The newest or most recent timestamp from which the Tweets will be provided.

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinceId

Returns results with a Tweet Id greater than (that is, more recent than) the specified SinceId.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UntilId

Returns results with a Tweet ID less less than (that is, older than) the specified UntilId.

```yaml
Type: System.String
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TwitterTimeline)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.8.4/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - GET /2/users/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-tweets)

[Api Reference - GET /2/users/:id/mentions](https://developer.twitter.com/en/docs/twitter-api/tweets/timelines/api-reference/get-users-id-mentions)
