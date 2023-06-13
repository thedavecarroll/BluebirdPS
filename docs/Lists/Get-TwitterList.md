---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList
schema: 2.0.0
---

# Get-TwitterList

## SYNOPSIS

Returns a specific list or all lists the authenticating or specified user owns.

## SYNTAX

### ByUser (Default)

```powershell
Get-TwitterList [-User <User>] [-SearchName <String>] [-IncludeExpansions] [<CommonParameters>]
```

### ByListId

```powershell
Get-TwitterList -Id <String> [-SearchName <String>] [-IncludeExpansions] [<CommonParameters>]
```

## DESCRIPTION

Returns a specific list or all lists the authenticating or specified user owns.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList
```

Returns the lists the authenticating user owns.

### Example 2

```powershell
PS > Get-TwitterUser -User PowerShell_Team | Get-TwitterList
```

Returns the lists the specified user owns.

### Example 3

```powershell
PS > Get-TwitterList -Id 749356646665629696
```

Returns the specified list.

## PARAMETERS

### -User

A Twitter user object, returned by Get-TwitterUser, for which to retrieve the lists.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: ByUser
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Id

The numerical id of the list.

```yaml
Type: System.String
Parameter Sets: ByListId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchName

Specifies the search string to match against the list Name property.

Note: All lists are returned, then filtered by the SearchName value. This capability is not inherently part of the Twitter API.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeExpansions

Include the list owner User object.

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

### BluebirdPS.APIV1.List

### BluebirdPS.APIV1.List[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Lists/Get-TwitterList)

[Api Reference - GET /2/lists/:id](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-lists-id)

[Api Reference - GET /2/users/:id/owned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/list-lookup/api-reference/get-users-id-owned_lists)
