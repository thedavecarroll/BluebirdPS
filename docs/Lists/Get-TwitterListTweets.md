---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListTweets
schema: 2.0.0
---

# Get-TwitterListTweets

## SYNOPSIS

Returns a timeline of Tweets authored by members of the specified list.

## SYNTAX

```powershell
Get-TwitterListTweets -List <List> [-IncludeExpansions] [-NonPublicMetrics] [-PromotedMetrics]
 [-OrganicMetrics] [-MaxResultsPerPage <Int32>] [-NoPagination] [<CommonParameters>]
```

## DESCRIPTION

Returns a timeline of Tweets authored by members of the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList -SearchName Retro | Get-TwitterListTweets -NoPagination -MaxResultsPerPage 10 -IncludeExpansions
```

Return the 10 latest Tweets from members of the specified list, including author user objects and any attachments.

### Example 2

```powershell
PS > Get-TwitterList -Id 749356646665629696 | Get-TwitterListTweets -NoPagination -MaxResultsPerPage 10
```

Return the Tweets from members of the specified list.

## PARAMETERS

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Returns the Tweet author user object and any attachments.

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

Include non-public engagement metrics for the Tweet at the time of the request.

NonPublic metrics include ImpressionCount, UrlLinkClicks, and UserProfileClicks.

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

Include engagement metrics, tracked in an organic context, for the Tweet at the time of the request.

OrganicMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

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

Include engagement metrics, tracked in a promoted context, for the Tweet at the time of the request.

PromotedMetrics include ImpressionCount, LikeCount, ReplyCount, RetweetCount, UrlLinkClicks, and UserProfileClicks.

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

### BluebirdPS.APIV1.List

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListTweets)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Api Reference - GET /2/lists/:id/tweets](https://developer.twitter.com/en/docs/twitter-api/lists/list-tweets/api-reference/get-lists-id-tweets)
