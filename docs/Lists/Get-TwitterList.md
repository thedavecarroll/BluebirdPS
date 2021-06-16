---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Lists/Get-TwitterList
schema: 2.0.0
---

# Get-TwitterList

## SYNOPSIS

Returns a specific list or all lists the authenticating or specified user subscribes to, including their own.

## SYNTAX

### ByListUserName (Default)

```powershell
Get-TwitterList [-UserName <String>] [-OwnedListFirst] [<CommonParameters>]
```

### ById

```powershell
Get-TwitterList -Id <String> [<CommonParameters>]
```

### BySlug

```powershell
Get-TwitterList -Slug <String> [-OwnerUserName <String>] [<CommonParameters>]
```

## DESCRIPTION

Returns a specific list or all lists the authenticating or specified user subscribes to, including their own.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterList
```

Returns the lists the authenticating user subscribes to, including their own.

### Example 2

```powershell
PS > Get-TwitterList -UserName BluebirdPS
```

Returns the lists that the user BluebirdPS subscribes to, including their own.

### Example 3

```powershell
PS > Get-TwitterList -Id 749356646665629696
```

Returns the specified list.

### Example 4

```powershell
PS > Get-TwitterList -Slug powershell-team -OwnerUserName powershell_team
```

Returns the specified list owned by the specified owner.

## PARAMETERS

### -UserName

Returns the lists that the specified user subscribes to, including their own.

If UserName, Id, and Slug are not provided, this command will return the lists for the authenticating user.

```yaml
Type: String
Parameter Sets: ByListUserName
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnedListFirst

Return the authenticating user's lists first.

```yaml
Type: SwitchParameter
Parameter Sets: ByListUserName
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

The numerical id of the list.

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

### -Slug

Returns the specified list based on the slug which is derived from the name of the list.

Note: Provide the list owner when returning a list based on the slug.

```yaml
Type: String
Parameter Sets: BySlug
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OwnerUserName

The username of the user that owns the list specified by the Slug parameter.

```yaml
Type: String
Parameter Sets: BySlug
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

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Lists/Get-TwitterList)

[Get-TwitterListByOwner](https://docs.bluebirdps.dev/en/v0.6.1/Lists/Get-TwitterListByOwner)

[Api Reference - GET lists/list](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list)

[Api Reference - GET lists/show](https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show)
