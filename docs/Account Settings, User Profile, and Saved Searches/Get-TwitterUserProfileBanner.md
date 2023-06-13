---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterUserProfileBanner
schema: 2.0.0
---

# Get-TwitterUserProfileBanner

## SYNOPSIS

Returns a map of the available size variations of the specified user's profile banner.

## SYNTAX

```powershell
Get-TwitterUserProfileBanner [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Returns a map of the available size variations of the specified user's profile banner.

The profile banner data available at each size variant's URL is in PNG format.

NOTE: This command currently returns the raw API response.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUserProfileBanner | ForEach-Object sizes
```

```text
ipad          : @{h=313; w=626; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/ipad}
ipad_retina   : @{h=626; w=1252; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/ipad_retina}
web           : @{h=260; w=520; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/web}
web_retina    : @{h=520; w=1040; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/web_retina}
mobile        : @{h=160; w=320; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/mobile}
mobile_retina : @{h=320; w=640; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/mobile_retina}
300x100       : @{h=100; w=300; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/300x100}
600x200       : @{h=200; w=600; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/600x200}
1500x500      : @{h=500; w=1500; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/1500x500}
1080x360      : @{h=360; w=1080; url=https://pbs.twimg.com/profile_banners/292670084/1600359337/1080x360}
```

Returns a map of the available size variations of the specified user's profile banner.

## PARAMETERS

### -UserName

The user name of the Twitter user for which you want to retrieve profile banner details.

If you do not specify a UserName, it will return the profile banner details for the authenticating user.

```yaml
Type: System.String
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

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Account%20Settings%2C%20User%20Profile%2C%20and%20Saved%20Searches/Get-TwitterUserProfileBanner)

[Api Reference - GET users/profile_banner](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner)
