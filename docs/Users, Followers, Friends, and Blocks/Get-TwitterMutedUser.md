---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser
schema: 2.0.0
---

# Get-TwitterMutedUser

## SYNOPSIS

Returns a collection of user objects or array of user ids that the authenticating user has muted.

## SYNTAX

```powershell
Get-TwitterMutedUser [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of user objects or array of user ids that the authenticating user has muted.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterMutedUser
```

Returns a list of user ids the authenticating user has muted.

### Example 2

```powershell
PS > Get-TwitterMutedUser | Get-TwitterUser
```

Use the list of user ids the authenticating user has muted as input for Get-TwitterUser.

## PARAMETERS

### -IncludeExpansions

Include additional data objects, such as the Tweet author's user, mentioned users, media, poll, and more.

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

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterMutedUser)

[Set-TwitterMutedUser](https://docs.bluebirdps.dev/en/v0.8.3/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Set-TwitterMutedUser)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.8.3/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[API Documentation - GET /2/users/:id/muting](https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/get-users-muting)
