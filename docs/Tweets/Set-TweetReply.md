---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Tweets/Set-TweetReply
schema: 2.0.0
---

# Set-TweetReply

## SYNOPSIS

Hides or unhides a reply to a Tweet.

## SYNTAX

### Hide (Default)

```powershell
Set-TweetReply -Id <String> [-Hide] [<CommonParameters>]
```

### Show

```powershell
Set-TweetReply -Id <String> [-Show] [<CommonParameters>]
```

## DESCRIPTION

Hides or unhides (shows) a reply to a Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Set-TweetReply -Id 1395747670065623050
```

Hides the reply.

### Example 2

```powershell
PS > Set-TweetReply -Id 1395747670065623050 -Show
```

Shows the reply.

## PARAMETERS

### -Id

The id of Tweet to hide or show.
The Tweet must belong to a conversation initiated by the authenticating user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hide

Hides the Tweet reply.

```yaml
Type: SwitchParameter
Parameter Sets: Hide
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Show

Shows the Tweet reply.

```yaml
Type: SwitchParameter
Parameter Sets: Show
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

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Tweets/Set-TweetReply)

[Api Documentation - PUT /2/tweets/:id/hidden](https://developer.twitter.com/en/docs/twitter-api/tweets/hide-replies/api-reference/put-tweets-id-hidden)
