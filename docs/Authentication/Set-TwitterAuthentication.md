---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterAuthentication
schema: 2.0.0
---

# Set-TwitterAuthentication

## SYNOPSIS

Set the session credential variable with an option to save credentials to an encrypted file.

## SYNTAX

```powershell
Set-TwitterAuthentication [[-ApiKey] <SecureString>] [[-ApiSecret] <SecureString>] [[-AccessToken] <SecureString>] [[-AccessTokenSecret] <SecureString>] [-Persist] [<CommonParameters>]
```

## DESCRIPTION

Set the session credential variable with an option to save credentials to an encrypted file.

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth v2 endpoints.

The provided credentials are validated using the Test-TwitterAuthentication command internally.

If using the Persist switch, the encrypted credentials file will be stored in the folder $env:HOME/.BluebirdPS.

## EXAMPLES

### Example 1

```powershell
PS > Set-TwitterAuthentication -Persist
```

```console
Api Key: ****************
Api Key Secret: ****************
Access Token: ****************
Access Token Secret: ****************
```

Set the credentials and save to an encrypted file.

## PARAMETERS

### -ApiKey

The API key, also sometimes called the consumer key.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiSecret

The API secret, also sometimes called the consumer secret.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessToken

The access token for the user.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessTokenSecret

The access token secret for the user.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Authentication/Set-TwitterAuthentication)

[Test-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Test-TwitterAuthentication)

[Import-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://bluebirdps.anovelidea.org/en/latest/Authentication/Export-TwitterAuthentication)

[Api Reference - Authentication](https://developer.twitter.com/en/docs/authentication/oauth-1-0a)
