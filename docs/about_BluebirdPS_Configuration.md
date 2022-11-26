# about_BluebirdPS_Configuration

## about_BluebirdPS_Configuration

# Short Description

BluebirdPS Configuration provides instructions to commands on how to handle rate limits, whether the raw API response should be returned, and information of configuration and credential file save locations.

# Long Description

BluebirdPS Configuration provides commands on how to handle rate limits, whether the raw API response should be returned, and information of configuration and credential file save locations. During module import, the session variable is created and the saved configuration is read from disk.

# User Settable Values

The user can use the command Set-BluebirdPSConfiguration to set the following values: RateLimitAction, RateLimitThreshold, and OutputType.

```text
Beginning with v0.8.2, the value for RateLimitAction can be set with the
environment variable BLUEBIRDPS_RATE_LIMIT_ACTION. If the environment variable
exists and the value is one of the allowed types, the Configuration value will
be overridden for the session.
```

```text
The RateLimitAction and RateLimitThreshold values instruct how and when to act
against the Twitter API rate limits.

The RateLimitAction value can be one of the following: Verbose, Warning, Error, or Resume

See Get-Help -Command Invoke-TwitterRequest for details on how Resume works.
```

The OutputType value specifies what type of data to return to the user.
The default OutputType is 'CustomClasses' (custom C# classes), but 'PSCustomObject' (as returned by Invoke-RestMethod) or 'JSON' can be specified.

# Other Values

The AuthUserId and AuthUserName are used by some endpoints that require the
authenticating user's id, or the user name. When the authentication credentials
are set, these configuration values are also set.

The AuthValidationDate and AuthLastExportDate are provided to help the user manage
credential refreshes.

The ConfigurationPath and CredentialsPath are used during the export of configuration
and authentication data.

# Keywords

Import-BluebirdPSConfiguration

Set-BluebirdPSConfiguration

Export-BluebirdPSConfiguration

Get-BluebirdPSConfiguration
