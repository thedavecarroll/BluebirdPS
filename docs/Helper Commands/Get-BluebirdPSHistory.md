---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Helper%20Commands/Get-BluebirdPSHistory
schema: 2.0.0
---

# Get-BluebirdPSHistory

## SYNOPSIS

Gets the current session history of commands and corresponding API responses with headers.

## SYNTAX

```powershell
Get-BluebirdPSHistory [[-First] <Int32>] [[-Last] <Int32>] [[-Skip] <Int32>] [[-SkipLast] <Int32>] [-Errors] [<CommonParameters>]
```

## DESCRIPTION

Gets the current session history of commands and corresponding API responses with headers.

Every command issued against the Twitter API is recorded in a session variable, including the results.

NOTE: On module import, if credentials have been saved, the Import-TwitterAuthentication makes 2 calls against the API.
These will be the first 2 entries in the history.

Each entry in the BluebirdPS history record includes the following fields:

GENERAL:

- Command: the name of the command
- ApiVersion: derived from the URI
- InvocationInfo: the PowerShell InvocationInfo for the specific Twitter API call

REQUEST:

- HttpMethod
- Uri: the full URI sent to Twitter including the query segment
- Body
- Form

HEADER RESPONSE:

- Server: responding Twitter server
- ResponseTime: time in milliseconds for the response
- RateLimit: the number of calls that can be made to the endpoint within a specified time frame
- RateLimitRemaining: the number of remaining calls to the endpoint
- RateLimitReset: the local time when the rate limit remaining counter will be reset and new calls may be placed
- The raw header response

API RESPONSE:

- Status: the http status of the call indicating success or specific failure
- The raw api response

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser -User BluebirdPS
PS > Get-BluebirdPSHistory -Last 1
```

```text
Command            : Get-TwitterUser
InvocationInfo     : System.Management.Automation.InvocationInfo
HttpMethod         : GET
Uri                : https://api.twitter.com/2/users/by/username/BluebirdPS?user.fields=id%2Cname%2Cusername%2Ccreated_at%2Cdescription%2Centities%2Clocation%2Cpinned_tweet_id%2Cprofile_image_ur
                     l%2Cprotected%2Cpublic_metrics%2Curl%2Cverified%2Cwithheld
Endpoint           : https://api.twitter.com/2/users/by/username/BluebirdPS
QueryString        : ?user.fields=id%2Cname%2Cusername%2Ccreated_at%2Cdescription%2Centities%2Clocation%2Cpinned_tweet_id%2Cprofile_image_url%2Cprotected%2Cpublic_metrics%2Curl%2Cverified%2Cwith
                     held
Body               :
Form               :
Status             : OK
Server             : tsa_b
ResponseTime       : 46
RateLimit          : 900
RateLimitRemaining : 898
RateLimitReset     : 5/24/2021 9:26:11 AM
HeaderResponse     : {X-Frame-Options, Cache-Control, x-rate-limit-reset, X-Content-Type-Options…}
ApiVersion         : 2
ApiResponse        : @{data=}
```

Get the last entry in BluebirdPS history variable.

### Example 2

```powershell
PS > Get-TwitterUser -User asdfasdfasdfasefase
PS > Get-BluebirdPSHistory -Last 1 -Errors | Format-List
```

```text
Command : Get-TwitterUser
Status  : BadRequest
Errors  : The `username` query parameter value [asdfasdfasdfasefase] does not match ^[A-Za-z0-9_]{1,15}$
```

Get any errors for the last entry in BluebirdPS history variable.

### Example 3

```powershell
PS > Get-Tweet -Id 1396829590190952451 -NonPublicMetrics
PS > Get-BluebirdPSHistory -Last 1 -Errors | Format-List
```

```text
Command : Get-Tweet
Status  : OK
Errors  : {Sorry, you are not authorized to access 'non_public_metrics.impression_count' on the Tweet with id : [1396829590190952451]., Sorry, you are not authorized to access
          'non_public_metrics.url_link_clicks' on the Tweet with id : [1396829590190952451]., Sorry, you are not authorized to access 'non_public_metrics.user_profile_clicks' on the Tweet with
          id : [1396829590190952451].}
```

Get any errors for the last entry in BluebirdPS history variable.
There may be more than one error returned from the API, as shown in this example.

## PARAMETERS

### -Errors

Returns the command name, status, and any errors that were returned in the API response.

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

### -First

Specifies the number of objects to select from the beginning of an array of input objects.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Last

Specifies the number of objects to select from the end of an array of input objects.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Skip

Skips (does not select) the specified number of items. By default, the Skip parameter counts from the beginning of the array or list of objects, but if the command uses the Last parameter, it counts from the end of the list or array.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipLast

Skips (does not select) the specified number of items from the end of the list or array. Works in the same way as using Skip together with Last parameter.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.ResponseData[]

### Selected.BluebirdPS.ResponseData[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Helper%20Commands/Get-BluebirdPSHistory)
