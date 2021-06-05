---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Set-BluebirdPSConfiguration
schema: 2.0.0
---

# Set-BluebirdPSConfiguration

## SYNOPSIS

Set one or more BluebirdPS configuration values.

## SYNTAX

```powershell
Set-BluebirdPSConfiguration [[-RateLimitAction] <RateLimitAction>] [[-RateLimitThreshold] <Int32>] [[-RawOutput] <Boolean>] [-Export] [<CommonParameters>]
```

## DESCRIPTION

Set one or more BluebirdPS configuration values.

Importing the module will create a module scoped variable which contains several configuration values.
This command sets updates the variable in the current session, and optionally exports the configuration to disk.

## EXAMPLES

### Example 1

```powershell
PS > Set-BluebirdPSConfiguration -RateLimitAction 'Warning' -RateLimitThreshold 10 -Export
```

Set the configuration value specifying that a message will be written to the Warning stream when the remaining calls to the endpoint is 10 or less.
Save the configuration to disk to be used for future sessions.

### Example 2

```powershell
PS > Set-BluebirdPSConfiguration -RawOutput $true
```

Set the configuration value specifying that no output will be parsed into rich objects.

## PARAMETERS

### -Export

Export the configuration using Export-BluebirdPSConfiguration.

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

### -RateLimitAction

Specify what action should be performed when the RateLimitThreshold is reached for any given endpoint.

This defaults to Verbose.

```yaml
Type: RateLimitAction
Parameter Sets: (All)
Aliases:
Accepted values: Verbose, Warning, Error

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RateLimitThreshold

Specify the threshold at which the RateLimitAction is taken.

The RateLimitThreshold does not effect any rate limit for any Twitter endpoint.

This defaults to 5.

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

### -RawOutput

Specify that the raw response should be presented to the user.

The JSON response from the API is converted to a [PSCustomObject]. If you want actual JSON, you will need to use `ConvertTo-Json -Depth 10`.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Export-BluebirdPSConfiguration)

[Import-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Import-BluebirdPSConfiguration)

[Get-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Get-BluebirdPSConfiguration)

[Set-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Set-BluebirdPSConfiguration)

[Api Reference - V2 Fields](https://developer.twitter.com/en/docs/twitter-api/fields)

[Api Reference - V2 Expansions](https://developer.twitter.com/en/docs/twitter-api/expansions)
