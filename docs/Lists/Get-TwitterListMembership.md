---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Lists/Get-TwitterListMembership
schema: 2.0.0
---

# Get-TwitterListMembership

## SYNOPSIS

Displays the public lists, or any lists owned by the authenticating user, of which the specified user is a member.

## SYNTAX

```powershell
Get-TwitterListMembership [-User <User>] [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
```

## DESCRIPTION

Displays the public lists, or any lists owned by the authenticating user, of which the specified user is a member.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListMembership
```

Display public lists whose membership includes the authenticating user.

### Example 2

```powershell
PS > Get-TwitterUser -User windosnz | Get-TwitterListMembership
```

Display public lists whose membership includes the user WindosNZ.

## PARAMETERS

### -User

A user object, returned by Get-TwitterUser, for which to return lists of which they are a member.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Include the list owner.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxResultsPerPage

The maximum number of results to be return by each page of the request.

Note:
By default, this command will request all available pages of data with each page request counting against the rate limit threshold.

You can force the command only return a single page with the NoPagination switch.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoPagination

Only return the first page of data for the request.

Note:
By default, this command will request all available pages of data with each page request counting against the rate limit threshold.

```yaml
Type: System.Management.Automation.SwitchParameter
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Get-TwitterListMembership)

[Api Reference - GET /2/users/:id/list_memberships](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-users-id-list_memberships)
