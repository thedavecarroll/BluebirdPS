---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Set-BluebirdPSConfiguration
schema: 2.0.0
---

# Set-BluebirdPSConfiguration

## SYNOPSIS

Set one or more BluebirdPS configuration values.

## SYNTAX

```powershell
Set-BluebirdPSConfiguration [[-RateLimitAction] <RateLimitAction>] [[-RateLimitThreshold] <Int32>]
 [-OutputType <OutputType>] [-Export] [<CommonParameters>]
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
PS > Set-BluebirdPSConfiguration -OutputType JSON
```

Set the configuration value specifying that no output will be parsed into rich objects.

## PARAMETERS

### -Export

Export the configuration using Export-BluebirdPSConfiguration.

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

### -RateLimitAction

Specify what action should be performed when the RateLimitThreshold is reached for any given endpoint.

This defaults to Verbose.

```yaml
Type: BluebirdPS.RateLimitAction
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
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputType

Specify the output type of all commands that connect to the Twitter API.

CustomClasses - This is the default selection which output response as classes defined in the BluebirdPS assembly.
JSON - The raw response as returned by the Twitter API.
PSCustomObject - Invoke-TwitterRequest uses Invoke-RestMethod which converts JSON into a PSCustomObject.

```yaml
Type: BluebirdPS.OutputType
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

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Export-BluebirdPSConfiguration)

[Import-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Import-BluebirdPSConfiguration)

[Get-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Get-BluebirdPSConfiguration)

[Set-BluebirdPSConfiguration](https://docs.bluebirdps.dev/en/v0.8.2/Helper%20Commands/Set-BluebirdPSConfiguration)

[Api Reference - V2 Fields](https://developer.twitter.com/en/docs/twitter-api/fields)

[Api Reference - V2 Expansions](https://developer.twitter.com/en/docs/twitter-api/expansions)
