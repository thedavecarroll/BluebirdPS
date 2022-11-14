---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListSubscription
schema: 2.0.0
---

# Remove-TwitterListSubscription

## SYNOPSIS

Unsubscribes the authenticating user from the specified list.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterListSubscription -Id <String> [<CommonParameters>]
```

### ByList

```powershell
Remove-TwitterListSubscription -List <List> [<CommonParameters>]
```

## DESCRIPTION

Unsubscribes the authenticating user from the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList -Id 1236361374567026688 | Remove-TwitterListSubscription
```

Get the Twitter list specified by the Id, then unsubscribe from it.

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
Accept pipeline input: False
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
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV1.List

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListSubscription)

[Add-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListSubscription)

[Get-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListSubscription)

[Test-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Test-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Api Reference - DELETE /2/users/:id/followed_lists/:list_id](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/delete-users-id-followed-lists-list_id)
