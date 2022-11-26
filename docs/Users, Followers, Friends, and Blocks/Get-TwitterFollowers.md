---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFollowers
schema: 2.0.0
---

# Get-TwitterFollowers

## SYNOPSIS

Returns a collection of Twitter users that follows the specified user.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterFollowers [-Id <String>] [-IncludeExpansions] [<CommonParameters>]
```

### ByUser

```powershell
Get-TwitterFollowers -User <User> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of Twitter users that follows the specified user.

If no user is specified, returns the followers of the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterFollowers
```

Returns the followers of the authenticating user.

### Example 2

```powershell
PS > Get-TwitterFollowers -Id 1330877955057344513
```

Returns the followers of the user specified by their id.

### Example 3

```powershell
PS > Get-TwitterUser -User BluebirdPS | Get-TwitterFollowers
```

Unfollows the user returned by Get-TwitterUser.

## PARAMETERS

### -Id

Specifies the id of the user to return their followers.

```yaml
Type: System.String
Parameter Sets: ById
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

The user object, returned by Get-TwitterUser, to return a list of users following them.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: ByUser
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Include the pinned Tweet for the returned user(s).

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

### System.String

### BluebirdPS.APIV2.UserInfo.User

## OUTPUTS

### BluebirdPS.APIV2.UserInfo.User[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterFollowers)

[Get-TwitterUser](https://docs.bluebirdps.dev/en/v0.8.2/Users%2C%20Followers%2C%20Friends%2C%20and%20Blocks/Get-TwitterUser)

[Api Reference - GET /2/users/:id/followers](https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-followers)
