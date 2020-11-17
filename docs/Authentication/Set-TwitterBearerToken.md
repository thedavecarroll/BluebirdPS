---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterBearerToken
schema: 2.0.0
---

# Set-TwitterBearerToken

## SYNOPSIS

The Set-TwitterBearerToken command receives and sets the user's bearer token credential.

## SYNTAX

```powershell
Set-TwitterBearerToken [-Persist] [<CommonParameters>]
```

## DESCRIPTION

The Set-TwitterBearerToken command receives and sets the user's bearer token credential.

The command sends the user's API key and API key secret to the Twitter and receives the bearer token which is saved in the session variable.

If using the Persist switch, the encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

## EXAMPLES

### Example 1

```powershell
PS > Set-TwitterBearerToken -Persist
```

Set the user's bearer token and save the session credentials in the folder $env:HOME/.BluebirdPS.

## PARAMETERS

### -Persist

Use this switch to save the tested credentials to an encrypted credentials file located in $env:HOME/.BluebirdPS.

```yaml
Type: SwitchParameter
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

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterBearerToken)

[Export-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Export-TwitterAuthentication)

[Api Reference - Authentication](https://developer.twitter.com/en/docs/authentication/api-reference/token)
