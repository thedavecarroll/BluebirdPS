---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterListMembership
schema: 2.0.0
---

# Get-TwitterListMembership

## SYNOPSIS

Displays the lists of which the specified user is a member.

## SYNTAX

```powershell
Get-TwitterListMembership [[-UserName] <String>] [-OwnedLists] [<CommonParameters>]
```

## DESCRIPTION

Displays the lists of which the specified user is a member.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListMembership
```

Display lists whose membership includes the authenticating user.

### Example 2

```powershell
PS > Get-TwitterListMembership -UserName WindosNZ
```

Display lists whose membership includes the user WindosNZ.

## PARAMETERS

### -UserName

Specifies the user for whom to return lists of which they are a member.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnedLists

Only display lists owned by the authenticating user which contains the specified user as a member.

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

### None

## OUTPUTS

### BluebirdPS.APIV1.List[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterListMembership)

[Api Reference - GET lists/memberships](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships)
