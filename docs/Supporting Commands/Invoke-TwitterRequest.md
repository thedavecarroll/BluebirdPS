---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Supporting%20Commands/Invoke-TwitterRequest
schema: 2.0.0
---

# Invoke-TwitterRequest

## SYNOPSIS

Sends a request to the Twitter API and returns rich objects or the raw API output.

## SYNTAX

```powershell
Invoke-TwitterRequest [-RequestParameters] <TwitterRequest> [<CommonParameters>]
```

## DESCRIPTION

Sends a request to the Twitter API and returns rich objects or the raw API output.

If BluebirdPS does not have a corresponding command to call a specific endpoint, this command can be used to send a request to the endpoint.

The API response is parsed based on the endpoint version, returning rich objects, or raw API output if no suitable object type exists.

This command handles API v2 pagination and v1.1 cursoring. Specifically, it will recurse when the raw API output includes meta.next_token or next_cursor.

See the contextual help about_BluebirdPS_TwitterRequest for details on using [BluebirdPS.TwitterRequest] class.

NOTE: This command does not handle any Twitter API streams and has only been tested against Standard v1.1 and v2 endpoints.

## EXAMPLES

### Example 1

```powershell
PS > $Request = [BluebirdPS.TwitterRequest]@{
       ExpansionType = 'User'
       Endpoint = 'https://api.twitter.com/2/users/by/username/bluebirdps'
}
PS > Invoke-TwitterRequest -RequestParameters $Request
```

```text
Id              : 1330877955057344513
Name            : BluebirdPS
UserName        : BluebirdPS
CreatedAt       : 11/23/2020 2:17:32 PM
Description     : #BluebirdPS is a Twitter automation client for #PowerShell 7. https://t.co/QcqHJ4gnHC https://t.co/UAip1CqJBb
Entities        : {https://bluebirdps.dev/, http://bit.ly/BluebirdPSDoc, http://bit.ly/BluebirdPSDiscussion}
Location        : Nashville, TN
PinnedTweetId   :
ProfileImageUrl : https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png
Protected       : False
PublicMetrics   : FollowersCount: 1, FollowingCount: 4, ListedCount: 0, TweetCount: 0
Url             : https://t.co/4Nk6DJgHFT
Verified        : False
Withheld        :
```

Get the user BluebirdPS using the specified endpoint using all field expansions for users.

### Example 2

```powershell
PS > $Request = [BluebirdPS.TwitterRequest]@{ Endpoint = 'https://api.twitter.com/2/users/by/username/bluebirdps' }
PS > Invoke-TwitterRequest -RequestParameters $Request
```

```text
Id              : 1330877955057344513
Name            :
UserName        : BluebirdPS
CreatedAt       :
Description     :
Entities        :
Location        :
PinnedTweetId   :
ProfileImageUrl :
Protected       : False
PublicMetrics   :
Url             :
Verified        : False
Withheld        :
```

Get the user BluebirdPS using the specified endpoint without using any field expansions.

### Example 3

```powershell
PS > Set-BluebirdPSConfiguration -OutputType JSON
PS > $Request = [BluebirdPS.TwitterRequest]@{
       ExpansionType = 'User'
       Endpoint = 'https://api.twitter.com/2/users/by/username/bluebirdps'
}
PS > Invoke-TwitterRequest -RequestParameters $Request
```

```json
{
  "data": {
    "username": "BluebirdPS",
    "profile_image_url": "https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png",
    "name": "BluebirdPS",
    "id": "1330877955057344513",
    "url": "https://t.co/4Nk6DJgHFT",
    "location": "Nashville, TN",
    "verified": false,
    "entities": {
      "url": "@{urls=System.Object[]}",
      "description": "@{urls=System.Object[]; hashtags=System.Object[]}"
    },
    "created_at": "2020-11-23T14:17:32Z",
    "public_metrics": {
      "followers_count": 1,
      "following_count": 4,
      "tweet_count": 0,
      "listed_count": 0
    },
    "protected": false,
    "description": "#BluebirdPS is a Twitter automation client for #PowerShell 7. https://t.co/QcqHJ4gnHC https://t.co/UAip1CqJBb"
  }
}
```

Set the BluebirdPS configuration value for OutputType to JSON, then get the user BluebirdPS using the specified endpoint with field expansions. Returns the raw API output.

## PARAMETERS

### -RequestParameters

A TwitterRequest object instance providing the HTTP method, endpoint, query, OAuth version, and more.

See about_TwitterRequest for details on using [BluebirdPS.TwitterRequest] class.

```yaml
Type: BluebirdPS.TwitterRequest
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### BluebirdPS.TwitterRequest

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Supporting%20Commands/Invoke-TwitterRequest)
