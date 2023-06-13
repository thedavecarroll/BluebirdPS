---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Test-TwitterListMembership
schema: 2.0.0
---

# Test-TwitterListMembership

## SYNOPSIS

Tests if a specified user is a member of the specified list.

## SYNTAX

```powershell
Test-TwitterListMembership [-List] <List> [-User] <User> [<CommonParameters>]
```

## DESCRIPTION

Tests if a specified user is a member of the specified list.

If the specified user is a member of the specified list, returns true, otherwise returns false.

## EXAMPLES

### Example 1

```powershell
PS > $List = Get-TwitterList -Id 92000812
PS > $List
PS > $List | Test-TwitterListMembership
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

Checks if the authenticating user is a member of the specified list.

### Example 2

```powershell
PS > $List | Test-TwitterListMembership -User (Get-TwitterUser -User joeyaiello)
```

```text
True
```

Checks if joeyaiello is a member of the specified list.

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

The Twitter user object to verify if they are a member of the specified list.

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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Test-TwitterListMembership)

[Get-TwitterListMembership](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterListMembership)
