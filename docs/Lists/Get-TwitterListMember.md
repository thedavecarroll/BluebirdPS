---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterListMember
schema: 2.0.0
---

# Get-TwitterListMember

## SYNOPSIS

Returns the user objects for members of the specified list.

## SYNTAX

### ById (Default)

```powershell
Get-TwitterListMember -Id <String> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [<CommonParameters>]
```

### ByList

```powershell
Get-TwitterListMember -List <List> [-IncludeExpansions] [-MaxResultsPerPage <Int32>] [-NoPagination]
 [<CommonParameters>]
```

## DESCRIPTION

Returns the user objects for members of the specified list.

Private list members will only be shown if the authenticated user owns the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListMember -Id 749356646665629696
```

Returns the members of the specified list.

### Example 2

```powershell
PS > Get-TwitterList -SearchName PSFollowFriday-ListOwners | Get-TwitterListMember | Format-Table -Property UserName,Name
```

Returns the members of the specified list.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: System.String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: ByList
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeExpansions

Include the list members pinned tweet.

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

### BluebirdPS.APIV1.List

## OUTPUTS

### System.String[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterListMember)

[Add-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Add-TwitterListMember)

[Remove-TwitterListMember](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Remove-TwitterListMember)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList)

[Api Reference - GET /2/lists/:id/members](https://developer.twitter.com/en/docs/twitter-api/lists/list-members/api-reference/get-lists-id-members)
