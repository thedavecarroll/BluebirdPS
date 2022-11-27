---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Test-TwitterAuthentication
schema: 2.0.0
---

# Test-TwitterAuthentication

## SYNOPSIS

The command Test-TwitterAuthentication is used to validate the user's credentials.

## SYNTAX

``` powershell
Test-TwitterAuthentication [-BearerToken] [<CommonParameters>]
```

## DESCRIPTION

The command Test-TwitterAuthentication is used to validate the user's credentials.

It will test the user's OAuth 1.0a credentials, or, by using the BearerToken switch, will test the user's OAuth 2 bearer token.

This command will update the BluebirdPS configuration property AuthValidationDate with the current date and then Export-BluebirdPSConfiguration.

## EXAMPLES

### Example 1

```powershell
PS > Test-TwitterAuthentication
```

Returns true if the user's OAuth 1.0a credentials are valid, otherwise it will return false.

### Example 2

```powershell
PS > Test-TwitterAuthentication -BearerToken
```

Returns true if the user's OAuth 2.0 bearer token is valid, otherwise it will return false.

## PARAMETERS

### -BearerToken

Instructs the command to test the user's OAuth 2.0 bearer token.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Authentication/Test-TwitterAuthentication)

[Api Reference - GET /2/users/me](https://developer.twitter.com/en/docs/twitter-api/users/lookup/api-reference/get-users-me)
