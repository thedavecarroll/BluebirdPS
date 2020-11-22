---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Tweets/Get-TweetLike
schema: 2.0.0
---

# Get-TweetLike

## SYNOPSIS

Returns recent Tweets liked by the specified user.

## SYNTAX

### ScreenName (Default)

```powershell
Get-TweetLike -ScreenName <String> [-Count <Int32>] [-SinceId <Int64>] [-MaxId <Int64>] [-ExcludeEntities] [<CommonParameters>]
```

### UserId

```powershell
Get-TweetLike -UserId <String> [-Count <Int32>] [-SinceId <Int64>] [-MaxId <Int64>] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns recent Tweets liked by the specified user.

Likes were previously called favorites.

## EXAMPLES

### Example 1

```powershell
PS > Get-TweetLike -ScreenName thedavecarroll
```

Return the last 20 tweets that the user, with the specified screen name, liked.

### Example 2

```powershell
PS > Get-TweetLike -ScreenName thedavecarroll -Count 15 -ExcludeEntities
```

Return the last 15 tweets that the user, with the specified screen name, liked excluding the entities in the results.

### Example 3

```powershell
PS > Get-TweetLike -UserId 292670084
```

Return the last 20 tweets that the user, with the specified id, liked.

## PARAMETERS

### -ScreenName

The screen name of the user for whom to return results.

```yaml
Type: String
Parameter Sets: ScreenName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId

The ID of the user for whom to return results.

```yaml
Type: String
Parameter Sets: UserId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count

Specifies the number of results to retrieve.

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

### -ExcludeEntities

Exclude the entities node.

This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags.

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

### -MaxId

Returns tweets with an id less than the value provided. Tweet id values roughly correlate to a date time.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinceId

Returns tweets with an id equal or greater than the value provided. Tweet id values roughly correlate to a date time.

```yaml
Type: Int64
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Tweets/Get-TweetLike)

[Set-TweetLike](https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike)

[Api Reference - GET favorites/list](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list)
