---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Tweets/Get-TweetPoll
schema: 2.0.0
---

# Get-TweetPoll

## SYNOPSIS

Display the Poll associated with a Tweet.

## SYNTAX

### ById (Default)

```powershell
Get-TweetPoll -Id <String> [<CommonParameters>]
```

### ByTweet

```powershell
Get-TweetPoll -Tweet <Tweet> [<CommonParameters>]
```

## DESCRIPTION

Display the Poll associated with a Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Get-TweetPoll -Id 1394308323839815687
```

```text
Id           : 1394308323424485378
Options      : {1) Id:12, 2) ObjectTypeId w/alias Id:3}
Duration     : 1440
EndDateTime  : 5/18/2021 3:06:23 PM
VotingStatus : Closed
```

Display the Poll associated with a Tweet.

### Example 2

```powershell
PS > Get-Tweet -Id 1394308323839815687 | Get-TweetPoll
```

Display the Poll associated with a Tweet.
The results are the same from example 1.

## PARAMETERS

### -Id

The id of Tweet object which has a poll.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Tweet

A Tweet object which has a poll.

```yaml
Type: Tweet
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

### System.String

### BluebirdPS.APIV2.TweetInfo.Tweet

## OUTPUTS

### BluebirdPS.APIV2.Objects.Poll

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Tweets/Get-TweetPoll)

[Get-Tweet](https://docs.bluebirdps.dev/en/v0.6.1/Tweets/Get-Tweet)
