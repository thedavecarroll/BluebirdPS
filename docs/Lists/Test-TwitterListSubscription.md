---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Lists/Test-TwitterListSubscription
schema: 2.0.0
---

# Test-TwitterListSubscription

## SYNOPSIS

Tests whether the authenticating user subscribes to the specified list.

## SYNTAX

### ById (Default)

```powershell
Test-TwitterListSubscription -Id <String> [-UserName <String>] [<CommonParameters>]
```

### ByList

```powershell
Test-TwitterListSubscription -List <List> [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Tests whether the authenticating user subscribes to the specified list.

## EXAMPLES

### Example 1

```powershell
PS > Test-TwitterListSubscription -Id 1236361374567026688
```

```text
False
```

Checks if the authenticating user is subscribed to the specified list.

### Example 2

```powershell
PS > Get-TwitterList -Slug ps7now-blog-week -OwnerUserName WindosNZ | Test-TwitterListSubscription
```

```text
True
```

Checks if the authenticating user is subscribed to the specified list.

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

### -UserName

The username to verify if they subscribe to the specified list.

```yaml
Type: String
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

### System.Boolean

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Test-TwitterListSubscription)

[Get-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListSubscription)

[Add-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Add-TwitterListSubscription)

[Remove-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Remove-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterList)

[Api Reference - GET lists/subscribers/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show)
