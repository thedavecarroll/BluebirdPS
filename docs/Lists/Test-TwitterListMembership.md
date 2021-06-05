---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Lists/Test-TwitterListMembership
schema: 2.0.0
---

# Test-TwitterListMembership

## SYNOPSIS

Tests if a specified user is a member of the specified list.

## SYNTAX

### Id (Default)

```powershell
Test-TwitterListMembership -Id <String> [-UserName <String>] [<CommonParameters>]
```

### ByList

```powershell
Test-TwitterListMembership -List <List> [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Tests if a specified user is a member of the specified list.

If the specified user is a member of the specified list, returns true, otherwise returns false.

## EXAMPLES

### Example 1

```powershell
PS > Test-TwitterListMembership -Id 1015226053856546816 -UserName thetommymaynard
```

```text
True
```

Checks if user thetommymaynard is a member of the specified list.

### Example 2

```powershell
PS > Get-TwitterList -Slug ps7now-blog-week -OwnerUserName WindosNZ | Test-TwitterListMembership
```

```text
True
```

Checks if the authenticating user is a member of the specified list.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: String
Parameter Sets: Id
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

### -UserName

The username to verify if they are a member of the specified list.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Lists/Test-TwitterListMembership)

[Get-TwitterListMembership](https://docs.bluebirdps.dev/en/v0.5.1/Lists/Get-TwitterListMembership)

[Api Reference - GET lists/members/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members-show)
