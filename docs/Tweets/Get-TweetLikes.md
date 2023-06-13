---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TweetLikes
schema: 2.0.0
---

# Get-TweetLikes

## SYNOPSIS

Return a Tweet's liking users.

## SYNTAX

### ById (Default)

```powershell
Get-TweetLikes [-Id] <String> [-IncludeExpansions] [<CommonParameters>]
```

### ByTweet

```powershell
Get-TweetLikes -Tweet <Tweet> [-IncludeExpansions] [<CommonParameters>]
```

## DESCRIPTION

Return a Tweet's liking users.

## EXAMPLES

### Example 1

```powershell
PS >  Get-TweetLikes -Id 1398279333823791104
```

Returns the Tweets liking users.

### Example 2

```powershell
PS >  Get-TweetLikes -Id 1398279333823791104 -IncludeExpansions
```

Returns the Tweets liking users and their pinned Tweets.

## PARAMETERS

### -Id

The id of the Tweet.

```yaml
Type: System.String
Parameter Sets: ById
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Include the pinned Tweet for a liking user.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Tweets/Get-TweetLikes)

[Api Reference - GET /2/tweets/:id/liking_users](https://developer.twitter.com/en/docs/twitter-api/tweets/likes/api-reference/get-tweets-id-liking_users)
