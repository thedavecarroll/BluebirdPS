---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListSubscription
schema: 2.0.0
---

# Add-TwitterListSubscription

## SYNOPSIS

Subscribes the authenticating user to the specified list.

## SYNTAX

### ById (Default)

```powershell
Add-TwitterListSubscription -Id <String> [<CommonParameters>]
```

### ByList

```powershell
Add-TwitterListSubscription -List <List> [<CommonParameters>]
```

## DESCRIPTION

Subscribes the authenticating user to the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Add-TwitterListSubscription -Id 1236361374567026688
```

Subscribe to the list with the specified id.

### Example 2

```powershell
PS > Get-TwitterUser -User windosnz | Get-TwitterList -SearchName blog | Add-TwitterListSubscription
```

Get the user windosnz, then get all public lists he owns that have 'blog' in the name, then subscribe to the list.

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
Accept pipeline input: True (ByValue)
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Add-TwitterListSubscription)

[Get-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterListSubscription)

[Remove-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Remove-TwitterListSubscription)

[Test-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Test-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.8.0/Lists/Get-TwitterList)

[Api Reference - POST /2/users/:id/followed_lists](https://developer.twitter.com/en/docs/twitter-api/lists/list-follows/api-reference/post-users-id-followed-lists)
