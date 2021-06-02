---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListSubscription
schema: 2.0.0
---

# Get-TwitterListSubscription

## SYNOPSIS

Returns a collection of lists to which the specified user is subscribed.

## SYNTAX

```powershell
Get-TwitterListSubscription [-UserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Returns a collection of lists to which the specified user is subscribed.

Does not include the user's own lists.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterListSubscription
```

Returns a collection of lists to which the authenticating user is subscribed.

### Example 2

```powershell
PS > Get-TwitterListSubscription -UserName BlueBirdPS
```

```text
Id              : 749356646665629696
CreatedAt       : 7/2/2016 4:38:41 PM
Slug            : powershell-team
Name            : PowerShell Team
FullName        : @PowerShell_Team/powershell-team
Description     : Members of the PowerShell Team at Microsoft
Uri             : https://twitter.com/PowerShell_Team/lists/powershell-team
Mode            : Public
MemberCount     : 23
SubscriberCount : 287
UserId          : 702907554368630784
UserName        : PowerShell_Team
Following       : True
```

Returns a collection of lists to which the specified user is subscribed.

## PARAMETERS

### -UserName

Specifies the user for which you want to obtain a collection of the lists to which they subscribe.

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

### None

### System.String

## OUTPUTS

### BluebirdPS.APIV1.List[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterListSubscription)

[Add-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Add-TwitterListSubscription)

[Remove-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Remove-TwitterListSubscription)

[Test-TwitterListSubscription](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Test-TwitterListSubscription)

[Get-TwitterList](https://docs.bluebirdps.dev/en/v0.5.0/Lists/Get-TwitterList)

[Api Reference - GET lists/subscriptions](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions)
