---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Searches/Search-Tweet
schema: 2.0.0
---

# Search-Tweet

## SYNOPSIS

Returns a collection of relevant Tweets matching a specified query.

## SYNTAX

```powershell
Search-Tweet [-SearchString] <String> [[-MaxResults] <Int32>] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of relevant Tweets matching a specified query.

## EXAMPLES

### Example 1

```powershell
PS > Search-Tweet -SearchString '(from:thedavecarroll) (#BluebirdPS)' -InformationVariable myinfo
```

```console
created_at                : Sat Nov 21 21:05:14 +0000 2020
id                        : 1330255977636048896
id_str                    : 1330255977636048896
text                      : Continuing work on #BluebirdPS #PowerShell 7 Twitter module. Tweaking the Send-TwitterMedia function.… https://t.co/ylU7YX8gBV
truncated                 : True
entities                  : @{hashtags=System.Object[]; symbols=System.Object[]; user_mentions=System.Object[]; urls=System.Object[]}
metadata                  : @{iso_language_code=en; result_type=recent}
source                    : <a href="https://powershell.anovelidea.org" rel="nofollow">thedavecarrroll-tweets-with-pwsh</a>
...
is_quote_status           : False
retweet_count             : 1
favorite_count            : 3
favorited                 : False
retweeted                 : False
possibly_sensitive        : False
lang                      : en
```

```powershell
PS > $myinfo.MessageData
```

```console
Command            : Search-Tweet
HttpMethod         : GET
Uri                : https://api.twitter.com/1.1/search/tweets.json
QueryString        : ?include_entities=true&q=%28from%3Athedavecarroll%29%20%28%23BluebirdPS%29
Status             : 200 OK
Server             : tsa_b
ResponseTime       : 55
RateLimit          : 180
RateLimitRemaining : 174
RateLimitReset     : 11/21/2020 8:25:04 PM
Response           : {[Cache-Control, System.String[]], [Date, System.String[]], [Pragma, System.String[]], [Server, System.String[]]…}

completed_in : 0.022
max_id       : 1330255977636048896
max_id_str   : 1330255977636048896
next_results : ?max_id=1330255977636048895&q=%28from%3Athedavecarroll%29%20%28%23BluebirdPS%29&include_entities=1
query        : %28from%3Athedavecarroll%29+%28%23BluebirdPS%29
refresh_url  : ?since_id=1330255977636048896&q=%28from%3Athedavecarroll%29%20%28%23BluebirdPS%29&include_entities=1
count        : 15
since_id     : 0
since_id_str : 0
```

Returns a collection of relevant Tweets matching a specified query.

## PARAMETERS

### -SearchString

The search string consisting of text and Twitter search operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

### -Count

Specifies the number of tweets to retrieve.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

Please note that Twitter's search service and, by extension, the Search API is not meant to be an exhaustive source of Tweets.
Not all Tweets will be indexed or made available via the search interface.

To learn how to use Twitter Search effectively, please see the Standard search operators page for a list of available filter operators.

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Searches/Search-Tweet)

[Test-SearchString](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Test-SearchString)

[Search Standard Operators](https://developer.twitter.com/en/docs/twitter-api/v1/rules-and-filtering/overview/standard-operators)

[Api Reference - GET search/tweets](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets)
