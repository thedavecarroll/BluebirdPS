---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Lists/Get-TwitterListByOwner
schema: 2.0.0
---

# Get-TwitterListByOwner

## SYNOPSIS

Returns the lists owned by the specified user.

## SYNTAX

```powershell
Get-TwitterListByOwner [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Returns the lists owned by the specified user.

Private lists will only be shown if the authenticated user is also the owner of the lists.

This command retrieves all the lists for a user, up to the 1000 they can create.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListByOwner
```

Display the lists owned by the authenticating user.

### Example 2

```powershell
PS > Get-TwitterListByOwner -UserName mikefrobbins
```

Display the lists owned by the authenticating user.

## PARAMETERS

### -UserName

Display the lists owned by the specified user.

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

### None

### System.String

## OUTPUTS

### BluebirdPS.APIV1.DirectMessage

### BluebirdPS.APIV1.DirectMessage[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Lists/Get-TwitterListByOwner)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.1/Lists/Get-TwitterList)

[Api Reference - GET lists/ownerships](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships)
