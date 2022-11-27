---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterBlockedUser
schema: 2.0.0
---

# Get-TwitterBlockedUser

## SYNOPSIS

Returns a collection of user objects that the authenticating user is blocking.

## SYNTAX

```powershell
Get-TwitterBlockedUser [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of user objects that the authenticating user is blocking.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterBlockedUser
```

Returns an array of user ids that the authenticating user is blocking.

### Example 2

```powershell
PS > Get-TwitterBlockedUser -IncludeExpansions
```

Returns a collection of user objects that the authenticating user is blocking without the last status for each.

## PARAMETERS

### -IncludeExpansions

Include the pinned Tweet for the returned user(s).

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

### BluebirdPS.APIV2.UserInfo.User[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterBlockedUser)

[Set-TwitterBlockedUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterBlockedUser)

[Api Reference - GET /2/users/:id/blocking](https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/get-users-blocking)
