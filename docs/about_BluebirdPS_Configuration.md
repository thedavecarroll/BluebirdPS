# about_BluebirdPS_Configuration

## about_BluebirdPS_Configuration

# Short Description

BluebirdPS Configuration provides instructions to commands on how to handle rate limits, whether the raw API response should be returned, and information of configuration and credential file save locations.

# Long Description

BluebirdPS Configuration provides commands on how to handle rate limits, whether the raw API response should be returned, and information of configuration and credential file save locations. During module import, the session variable is created and the saved configuration is read from disk.

# User Settable Values

The use can use Set-BluebirdPSConfiguration to set the following values: RateLimitAction, RateLimitThreshold, and RawOutput.

```text
The RateLimitAction and RateLimitThreshold values instruct how and when to act
against the Twitter API rate limits.
```

```text
The RawOutput value specifies whether the raw response should be presented to the
user, or return rich objects. The module uses Invoke-RestMethod which converts JSON
response to a [PSCustomObject].
```

# Other Values

```text
The AuthUserId and AuthUserName are used by some endpoints that require the
authenticating user's id, or the user name. When the authentication credentials
are set, these configuration values are also set.
```

```text
The AuthValidationDate and AuthLastExportDate are provided to help the user manage
credential refreshes.
```

```text
The ConfigurationPath and CredentialsPath are used during the export of configuration
and authentication data.
```

# Keywords

Import-BluebirdPSConfiguration

Set-BluebirdPSConfiguration

Export-BluebirdPSConfiguration

Get-BluebirdPSConfiguration
