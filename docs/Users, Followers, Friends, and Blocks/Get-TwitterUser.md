---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser
schema: 2.0.0
---

# Get-TwitterUser

## SYNOPSIS

Returns a variety of information about the specified user.

## SYNTAX

### __AllParameterSets

```powershell
Get-TwitterUser [[-User <String[]>]] [-IncludeExpansions] [<CommonParameters>]
```

## DESCRIPTION

Returns a variety of information about the specified user.

If no input is provided, returns the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser
```

```text
Id              : 292670084
Name            : Dave Carroll
UserName        : thedavecarroll
CreatedAt       : 5/4/2011 1:22:46 AM
Description     : Married to an amazing woman. #PowerShell #Blogger #RushTheBand #RetroComputing #Puns #Doggos #Tech #StarTrek #INTJ https://t.co/fLbRHoxt39
Entities        : {https://powershell.anovelidea.org/, https://pronoun.is/he}
Location        : Nashville, TN
PinnedTweetId   : 1385709814890864648
ProfileImageUrl : https://pbs.twimg.com/profile_images/1332944757186760704/s4AjaIMg_normal.jpg
Protected       : False
PublicMetrics   : FollowersCount: 947, FollowingCount: 1654, ListedCount: 27, TweetCount: 6475
Url             : https://t.co/G5ojwP677I
Verified        : False
Withheld        :
```

Return the authenticating user's information.

### Example 2

```powershell
PS > Get-TwitterUser -User 1330877955057344513,thedavecarroll,TwitterDev
```

Return the user information for the 3 specified users.

### Example 3

```powershell
PS > 3234616374,1330877955057344513,'thedavecarroll' |  Get-TwitterUser
```

Return the user information for the specified user.

## PARAMETERS

### -User

One or more identifiers for a Twitter user.
You can provide UserName, Id, or a combination of both as this command will send the appropriate request to the Twitter API.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True (None) False (All)
Position: 0
Default value:
Accept pipeline input: True
Accept wildcard characters: False
```

### -IncludeExpansions

Include the pinned Tweet for the returned user(s).

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### BluebirdPS.APIV2.UserInfo.User

### BluebirdPS.APIV2.UserInfo.User[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - GET /2/users/by](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by)

[Api Reference - GET /2/users/by/username/:username](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-by-username-username)

[Api Reference - GET /2/users](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users)

[Api Reference - GET /2/users/:id](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-id)
