---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Lists/Test-TwitterListSubscription
schema: 2.0.0
---

# Test-TwitterListSubscription

## SYNOPSIS

Tests whether the authenticating or specified user subscribes to the specified public list.

## SYNTAX

```powershell
Test-TwitterListSubscription [-List] <List> [[-User] <User>] [<CommonParameters>]
```

## DESCRIPTION

Tests whether the authenticating or specified user subscribes to the specified public list.

## EXAMPLES

### Example 1

```powershell
PS > $List = Get-TwitterList -Id 92000812
PS > $List
PS > $List | Test-TwitterListSubscription
```

```text
Id            : 92000812
Name          : ps1
CreatedAt     : 6/27/2013 7:42:03 PM
FollowerCount : 360
MemberCount   : 57
Description   : Powershell bloggers, trainers, authors - additions, recommendations welcome.
Private       : False
OwnerId       : 16177793

True
```

Checks if the authenticating user is subscribed to the specified list.

### Example 2

```powershell
PS > $User = Get-TwitterUser -User mikefrobbins
PS > $List | Test-TwitterListSubscription -User $User
```

```text
False
```

Checks if the specified user is subscribed to the specified public list.

## PARAMETERS

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

A Twitter user object returned by Get-TwitterUser.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
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

### BluebirdPS.APIV2.ListInfo.List

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Lists/Test-TwitterListSubscription)

[Get-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.2/Lists/Get-TwitterListSubscription)

[Add-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.2/Lists/Add-TwitterListSubscription)

[Remove-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.2/Lists/Remove-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.2/Lists/Get-TwitterList)
