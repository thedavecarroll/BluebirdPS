---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/User%20Profile/Get-TwitterUserProfileBanner
schema: 2.0.0
---

# Get-TwitterUserProfileBanner

## SYNOPSIS

Returns a map of the available size variations of the specified user's profile banner.

## SYNTAX

### ScreenName

```powershell
Get-TwitterUserProfileBanner -ScreenName <String> [<CommonParameters>]
```

### UserId

```powershell
Get-TwitterUserProfileBanner -UserId <String> [<CommonParameters>]
```

## DESCRIPTION

Returns a map of the available size variations of the specified user's profile banner.

The profile banner data available at each size variant's URL is in PNG format.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUserProfileBanner -ScreenName thedavecarroll
```

```console
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/User%20Profile/Get-TwitterUserProfileBanner)

[Api Reference - GET users/profile_banner](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner)
