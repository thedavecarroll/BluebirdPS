---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Authentication/Set-TwitterAuthentication
schema: 2.0.0
---

# Set-TwitterAuthentication

## SYNOPSIS

Set the session credential variable and export verified credentials to an encrypted file.

## SYNTAX

```powershell
Set-TwitterAuthentication [[-ApiKey] <SecureString>] [[-ApiSecret] <SecureString>]
 [[-AccessToken] <SecureString>] [[-AccessTokenSecret] <SecureString>] [<CommonParameters>]
```

## DESCRIPTION

Set the session credential variable and export verified credentials to an encrypted file.

The credentials are the API Key, API Key Secret, Access Token, Access Token Secret, and, if present, the bearer token for OAuth 2.0.

The provided credentials are validated using Test-TwitterAuthentication and, if valid, are used to request the bearer token via Set-TwitterBearerToken.
This command also updates the BluebirdPS Configuration with the authenticating user's Id and UserName.
Lastly, it exports the updated session credential variable using Export-TwitterAuthentication.

## EXAMPLES

### Example 1

```powershell
PS > Set-TwitterAuthentication
```

```text
API Key: *************************
API Secret: **************************************************
Access Token: **************************************************
Access Token Secret: *********************************************
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Authentication/Set-TwitterAuthentication)

[Test-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.7.0/Authentication/Test-TwitterAuthentication)

[Import-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.7.0/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.7.0/Authentication/Export-TwitterAuthentication)

[Api Reference - Authentication Overview](https://developer.twitter.com/en/docs/authentication/overview)
