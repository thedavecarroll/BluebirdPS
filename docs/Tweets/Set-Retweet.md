---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-Retweet
schema: 2.0.0
---

# Set-Retweet

## SYNOPSIS

Retweet or unretweet an existing tweet.

## SYNTAX

### Retweet (Default)

```powershell
Set-Retweet -Id <Int64> [-Retweet] [<CommonParameters>]
```

### Unretweet

```powershell
Set-Retweet -Id <Int64> [-Unretweet] [<CommonParameters>]
```

## DESCRIPTION

Retweet or unretweet an existing tweet.

Returns the original Tweet with Retweet details embedded.

## EXAMPLES

### Example 1

```powershell
PS > Set-Retweet -Id 1330354141055643648
```

Retweets the specified tweet.

### Example 2

```powershell
PS > Set-Retweet -Id 1330354141055643648 -Unretweet
```

Unretweets the specified tweet.

## PARAMETERS

### -Id

The id of the tweet.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retweet

Instructs the command to retweet the specified tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Retweet
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unretweet

Instructs the command to unretweet the specified tweet.

```yaml
Type: SwitchParameter
Parameter Sets: Unretweet
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-Retweet)

[Get-Tweet](https://bluebirdps.anovelidea.org/en/latest/Tweets/Get-Tweet)

[API Documentation - POST statuses/retweet/:id](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-retweet-id)

[API Documentation - POST statuses/unretweet/:id](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-unretweet-id)
