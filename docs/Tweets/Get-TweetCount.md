---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Tweets/Get-TweetCount
schema: 2.0.0
---

# Get-TweetCount

## SYNOPSIS

Returns a time series of count of Tweets from the last seven days that match a search query.

## SYNTAX

### Default (Default)

```powershell
Get-TweetCount [-SearchString] <String> [[-Granularity] <String>] [[-StartTime] <DateTime>]
 [[-EndTime] <DateTime>] [[-SinceId] <String>] [[-UntilId] <String>] [<CommonParameters>]
```

### Summary

```powershell
Get-TweetCount [-SearchString] <String> [[-Granularity] <String>] [[-StartTime] <DateTime>]
 [[-EndTime] <DateTime>] [[-SinceId] <String>] [[-UntilId] <String>] [-Summary] [<CommonParameters>]
```

### CountOnly

```powershell
Get-TweetCount [-SearchString] <String> [[-Granularity] <String>] [[-StartTime] <DateTime>]
 [[-EndTime] <DateTime>] [[-SinceId] <String>] [[-UntilId] <String>] [-CountOnly] [<CommonParameters>]
```

## DESCRIPTION

Returns a time series of count of Tweets from the last seven days that match a search query.

## EXAMPLES

### Example 1

```powershell
PS >  Get-TweetCount -SearchString '#PowerShell'
```

```text
Start                 End                   Count
-----                 ---                   -----
6/18/2021 7:25:13 PM  6/18/2021 8:00:00 PM      2
6/18/2021 8:00:00 PM  6/18/2021 9:00:00 PM      9
6/18/2021 9:00:00 PM  6/18/2021 10:00:00 PM     4
<truncated>
6/25/2021 5:00:00 PM  6/25/2021 6:00:00 PM      5
6/25/2021 6:00:00 PM  6/25/2021 7:00:00 PM      6
6/25/2021 7:00:00 PM  6/25/2021 7:25:13 PM      1
```

Returns an hourly count of the Tweets matching the search string for the last 7 days.

### Example 2

```powershell
PS >  Get-TweetCount -SearchString '#PowerShell' -Granularity Day -StartTime (Get-Date).AddDays(-3)
```

```text
Start                End                  Count
-----                ---                  -----
6/22/2021 7:27:10 PM 6/23/2021 7:00:00 PM   187
6/23/2021 7:00:00 PM 6/24/2021 7:00:00 PM   193
6/24/2021 7:00:00 PM 6/25/2021 7:00:00 PM   235
6/25/2021 7:00:00 PM 6/25/2021 7:27:00 PM     1
```

Returns a daily count of the Tweets matching the search string for the last 4 days.

### Example 3

```powershell
PS >  Get-TweetCount -SearchString '#PowerShell' -Summary
```

```text
SearchString : #PowerShell
Granularity  : Hour
StartTime    : 6/18/2021 7:27:54 PM
EndTime      : 6/25/2021 7:27:54 PM
TotalCount   : 1357
```

Returns a summary for Tweets matching the search string for the last 7 days.

### Example 4

```powershell
PS >   Get-TweetCount -SearchString '#PowerShell' -CountOnly
```

```text
1357
```

Returns only the total Tweets matching the search string for the last 7 days.

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

### -Granularity

Specifies the granularity that you want the time series count data to be grouped by.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:
Accepted values: Minute, Hour, Day

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartTime

The oldest or earliest timestamp from which the Tweet counts will be provided.

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndTime

The newest or most recent timestamp from which the Tweet counts will be provided.

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinceId

Returns results with a Tweet Id greater than (that is, more recent than) the specified SinceId.

The Id is exclusive and responses will not include it.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UntilId

Returns results with a Tweet ID less less than (that is, older than) the specified UntilId.

The Id is exclusive and responses will not include it.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CountOnly

Returns only the count of Tweets for the search query.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: CountOnly
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Summary

Returns a summary of the search query.

This summary includes the search string, granularity used in the call, the start and end times that bound the search results, and the total Tweet count.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: Summary
Aliases:

Required: True
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Tweets/Get-TweetCount)

[Get-Tweet](https://docs.bluebirdps.dev/en/v0.8.0/Tweets/Get-Tweet)

[Api Reference - GET /2/tweets/counts/recent](https://developer.twitter.com/en/docs/twitter-api/tweets/counts/api-reference/get-tweets-counts-recent)
