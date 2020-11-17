---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Get-TwitterApiEndpoint
schema: 2.0.0
---

# Get-TwitterApiEndpoint

## SYNOPSIS

Displays the Twitter Api endpoint metadata for endpoints supported by this module.

## SYNTAX

### Endpoint (Default)

```powershell
Get-TwitterApiEndpoint [[-Endpoint] <String[]>] [<CommonParameters>]
```

### Command

```powershell
Get-TwitterApiEndpoint [-Command <String>] [<CommonParameters>]
```

## DESCRIPTION

Displays the Twitter Api endpoint metadata for endpoints supported by this module.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterApiEndpoint -Command Get-TwitterAccountSettings)
```

Display the metadata for the command Get-TwitterAccountSettings

## PARAMETERS

### -Endpoint

Specifies the category of API endpoint that will be displayed.

```yaml
Type: String[]
Parameter Sets: Endpoint
Aliases:
Accepted values: account, blocks, mutes, users, followers, friends, friendships, lists, help

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Command

Specifies the name of the module's function which to display the metadata for the API endpoint(s).

```yaml
Type: String
Parameter Sets: Command
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

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Get-TwitterApiEndpoint)
