---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterHistory
schema: 2.0.0
---

# Get-TwitterHistory

## SYNOPSIS

Displays the run history commands from the module that connects to the Twitter API.

## SYNTAX

### Default (Default)

```powershell
Get-TwitterHistory [<CommonParameters>]
```

### First

```powershell
Get-TwitterHistory [-First <Int32>] [<CommonParameters>]
```

### Last

```powershell
Get-TwitterHistory [-Last <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Displays the run history commands from the module that connects to the Twitter API.

Some API calls, such as the append call within the Send-TwitterMedia command, may not added to history as there could hundreds of such calls when uploading large videos.

The data contained in each record in history is the same that is written to the information stream.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-TwitterHistory
```

Displays the run history commands from the module that connects to the Twitter API.

### Example 2

```powershell
PS C:\> Get-TwitterHistory -First 1
```

```console
Command            : Get-TwitterUserList
HttpMethod         : GET
Uri                : https://api.twitter.com/1.1/users/lookup.json
QueryString        : ?include_entities=true&screen_name=rtpsug,thedavecarroll,powershell_team
Status             : 200 OK
Server             : tsa_b
ResponseTime       : 169
RateLimit          : 900
RateLimitRemaining : 898
RateLimitReset     : 11/22/2020 12:03:29 PM
Response           : {[Cache-Control, System.String[]], [Date, System.String[]], [Pragma, System.String[]], [Server, System.String[]]…}
```

Display the first command that connected to the Twitter API.

### Example 3

```powershell
PS > Get-TwitterHistory -Last 1
```

Display the last command that connected to the Twitter API.

## PARAMETERS

### -First

Returns the number of first entries in the history for the session as specified.

```yaml
Type: Int32
Parameter Sets: First
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Last

Returns the number of last entries in the history for the session as specified.

```yaml
Type: Int32
Parameter Sets: Last
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterHistory)
