---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListTweets
schema: 2.0.0
---

# Get-TwitterListTweets

## SYNOPSIS

Returns a timeline of Tweets authored by members of the specified list.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterListTweets -Id <String> [-SinceId <String>] [-MaxId <String>] [-ExcludeRetweets] [<CommonParameters>]
```

### ByList

```powershell
Get-TwitterListTweets -List <List> [-SinceId <String>] [-MaxId <String>] [-ExcludeRetweets] [<CommonParameters>]
```

## DESCRIPTION

Returns a timeline of Tweets authored by members of the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListTweets -Id 79064151
```

Return the Tweets from members of the specified list.

### Example 2

```powershell
PS > Get-TwitterList -Slug psconfbook -OwnerUserName mikefrobbins | Get-TwitterListTweets
```

Return the Tweets from members of the specified list.

## PARAMETERS

### -SinceId

Returns Tweets with an id equal or greater than the value provided.
Tweet id values roughly correlate to a date time.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxId

Returns Tweets with an id less than the value provided.
Tweet id values roughly correlate to a date time.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeRetweets

By default, retweets are included.
Use the ExcludeRetweets switch to omit retweets from the results.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

The id of the list.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: List
Parameter Sets: ByList
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

### BluebirdPS.APIV1.List

## OUTPUTS

### BluebirdPS.APIV2.TweetInfo.Tweet[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListTweets)

[Get-TwitterListMember](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterList)

[Api Reference - GET lists/statuses](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses)
