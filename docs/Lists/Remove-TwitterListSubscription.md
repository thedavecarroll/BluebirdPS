---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Lists/Remove-TwitterListSubscription
schema: 2.0.0
---

# Remove-TwitterListSubscription

## SYNOPSIS

Unsubscribes the authenticating user from the specified list.

## SYNTAX

### ById (Default)

```powershell
Remove-TwitterListSubscription -Id <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByList

```powershell
Remove-TwitterListSubscription -List <List> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Unsubscribes the authenticating user from the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Remove-TwitterListSubscription -Id 1236361374567026688
```

Unsubscribe from the specified list.

### Example 2

```powershell
PS > Get-TwitterList -Slug ps7now-blog-week -OwnerUserName WindosNZ | Remove-TwitterListSubscription
```

Get the list specified by the slug and ower name, then unsubscribe from it.

## PARAMETERS

### -Id

The id of the list.

```yaml
Type: String
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
Type: List
Parameter Sets: ByList
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Remove-TwitterListSubscription)

[Add-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Add-TwitterListSubscription)

[Get-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterListSubscription)

[Test-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Test-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.6.2/Lists/Get-TwitterList)

[Api Reference - POST lists/subscribers/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy)
