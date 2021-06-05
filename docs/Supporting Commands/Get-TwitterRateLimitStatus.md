---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Supporting%20Commands/Get-TwitterRateLimitStatus
schema: 2.0.0
---

# Get-TwitterRateLimitStatus

## SYNOPSIS

Returns the current rate limits for methods belonging to the specified resource families.

## SYNTAX

```powershell
Get-TwitterRateLimitStatus [[-Resources] <String[]>] [<CommonParameters>]
```

## DESCRIPTION

Returns the current rate limits for methods belonging to the specified resource families.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterRateLimitStatus
```

Returns the current rate limits for all resources.

### Example 2

```powershell
PS > $SavedSearches = Get-TwitterRateLimitStatus -Resources saved_searches
PS > $SavedSearches.resources.saved_searches | Format-List
```

```text
/saved_searches/destroy/:id : @{limit=15; remaining=15; reset=1621904304}
/saved_searches/show/:id    : @{limit=15; remaining=15; reset=1621904304}
/saved_searches/list        : @{limit=15; remaining=15; reset=1621904304}
```

Returns the current rate limits for the friends resource.

The output was converted to JSON for easier readability.

NOTE: This command currently returns the raw API response.

## PARAMETERS

### -Resources

A comma-separated list of resource families you want to know the current rate limit disposition for.

For best performance, only specify the resource families pertinent to your application.

See API Rate Limiting for more information.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:
Accepted values: lists, application, mutes, live_video_stream, friendships, guide, auth, blocks, geo, users, teams, followers, collections, statuses, custom_profiles, webhooks, contacts, labs, i, tweet_prompts, moments, limiter_scalding_report_creation, fleets, help, feedback, business_experience, graphql&POST, friends, sandbox, drafts, direct_messages, media, traffic, account_activity, account, safety, favorites, device, tweets, saved_searches, oauth, search, trends, live_pipeline, graphql

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Supporting%20Commands/Get-TwitterRateLimitStatus)

[Api Reference - GET application/rate_limit_status](https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/rate-limit-status/api-reference/get-application-rate_limit_status)
