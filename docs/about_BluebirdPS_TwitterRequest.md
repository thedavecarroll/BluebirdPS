# about_BluebirdPS_TwitterRequest

## about_BluebirdPS_TwitterRequest

# Short Description

The BluebirdPS module includes a class called [BluebirdPS.TwitterRequest] which can be used in conjunction with Invoke-TwitterRequest to make ad hoc calls against the Twitter API.

# Long Description

Using [BluebirdPS.TwitterRequest] will allow the user to craft requests for the Twitter API.
The Invoke-TwitterRequest command performs all of the processing.

```text
Any API response that matches existing definitions will return rich objects specific
to the data returned. Otherwise, the raw API response will be returned.
```

# Academic Research Track

If your application for the Application Research track has been approved, you should be able to use the method described herein to makes requests against the search/recent/all endpoint.

# Streams Not Supported

The command Invoke-TwitterRequest uses Invoke-RestMethod which does not support response streams.

```text
You cannot use this module to consume any stream endpoints, such as
/2/tweets/sample/stream or /2/tweets/search/stream.
```

# Examples

Enable RawOutput in configuration.

```powershell
Set-BluebirdPSConfiguration -RawOutput $true
```

### Update Profile URL

```powershell
$Request = [BluebirdPS.TwitterRequest]@{
    HttpMethod = 'POST'
    Endpoint = 'https://api.twitter.com/1.1/account/update_profile.json'
    Query = @{ url = 'thedavecarroll.com' }
}

Invoke-TwitterRequest -RequestParameters $Request
```

### Get Blocked Users

```powershell
$Request = [BluebirdPS.TwitterRequest]@{
    Endpoint = 'https://api.twitter.com/2/users/292670084/blocking'
}

Invoke-TwitterRequest -RequestParameters $Request
```

BluebirdPS already supports this endpoint, returning only the usernames.

# Keywords

Twitter

TwitterAPI

BluebirdPS.TwitterRequest

Invoke-TwitterRequest
