---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterTimeline
schema: 2.0.0
---

# Get-TwitterTimeline

## SYNOPSIS

Returns mentions or home timeline of the authenticating user, or a specified user's timeline.

## SYNTAX

### Mentions

```powershell
Get-TwitterTimeline [-MentionsTimeline] [-Count <Int32>] [<CommonParameters>]
```

### Home

```powershell
Get-TwitterTimeline [-HomeTimeline] [-Count <Int32>] [<CommonParameters>]
```

### User

```powershell
Get-TwitterTimeline [-ScreenName <String>] [-UserId <String>] [-ExcludeRetweets] [-Count <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Returns the mentions or home timeline of the authenticating user, or a specified user's timeline.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterTimeline -MentionsTimeline -Count 5
```

Returns the last 5 mentions for the authenticating user.

### Example 2

```powershell
PS > Get-TwitterTimeline -HomeTimeline
```

Returns the last 20 Tweets for the authenticating user and the users they follow.

### Example 3

```powershell
PS > Get-TwitterTimeline -ScreenName rtpsug -Count 50
```

Returns the last 50 Tweets for the specified user and the users they follow.

## PARAMETERS

### -MentionsTimeline

Returns the mentions, Tweets containing the user's @screen_name, for the authenticating user.

```yaml
Type: SwitchParameter
Parameter Sets: Mentions
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HomeTimeline

Returns a collection of the most recent Tweets and Retweets posted by the authenticating user and the users they follow.

```yaml
Type: SwitchParameter
Parameter Sets: Home
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: User
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: String
Parameter Sets: User
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count

The number of Tweets to return for the specified timeline.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeRetweets

By default, retweets are included. Use the ExcludeRetweets switch to omit retweets from the results.

```yaml
Type: SwitchParameter
Parameter Sets: User
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterTimeline)

[API Documentation - GET statuses/mentions_timeline](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-mentions_timeline)

[API Documentation - GET statuses/home_timeline](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-home_timeline)

[API Documentation - GET statuses/user_timeline](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-user_timeline)
