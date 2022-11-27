---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Lists/Set-TwitterPinnedList
schema: 2.0.0
---

# Set-TwitterPinnedList

## SYNOPSIS

Allows the authenticating user to pin or unpin a List.

## SYNTAX

### PinList (Default)

```powershell
Set-TwitterPinnedList -List <List> [-PinList] [<CommonParameters>]
```

### UnpinList

```powershell
Set-TwitterPinnedList -List <List> [-UnpinList] [<CommonParameters>]
```

## DESCRIPTION

Allows the authenticating user to pin or unpin a List.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList -Id 1400680326754615296 | Set-TwitterPinnedList
```

```text
List Id: 1400680326754615296, Name: PSFollowFriday-ListOwners is pinned
```

Pin the list PSFollowFriday-ListOwners.

### Example 2

```powershell
PS > Get-TwitterPinnedList | Select-Object -Last 1 | Set-TwitterPinnedList -UnpinList
```

```text
List Id: 1400680326754615296, Name: PSFollowFriday-ListOwners is not pinned
```

Unpin the last pinned list.

## PARAMETERS

### -List

A list object retrieved from Get-TwitterList.

```yaml
Type: BluebirdPS.APIV2.ListInfo.List
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PinList

Allows the authenticating user to pin a list.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: PinList
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UnpinList

Allows the authenticating user to unpin a list.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: UnpinList
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

### BluebirdPS.APIV2.ListInfo.List

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Set-TwitterPinnedList)

[Get-TwitterPinnedLis](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Get-TwitterPinnedList)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.3/Lists/Get-TwitterList)

[Api Reference - POST /2/users/:id/pinned_lists](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/post-users-id-pinned-lists)

[Api Reference - DELETE /2/users/:id/pinned_lists/:list_id](https://developer.twitter.com/en/docs/twitter-api/lists/pinned-lists/api-reference/delete-users-id-pinned-lists-list_id)
