---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Authentication/Show-TwitterAuthentication/
schema: 2.0.0
---

# Show-TwitterAuthentication

## SYNOPSIS

Display the current values for ApiKey, ApiSecret, AccessToken, AccessTokenSecret, and BearerToken.

## SYNTAX

```powershell
Show-TwitterAuthentication [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Display the current values for ApiKey, ApiSecret, AccessToken, AccessTokenSecret, and BearerToken.

This allows you to verify the values entered.

## EXAMPLES

### Example 1

```powershell
PS > Show-TwitterAuthentication
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Show" on target "Twitter Authentication".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y

ApiKey            : T...B
ApiSecret         : Y...3
AccessToken       : 2...4-A...z
AccessTokenSecret : H...d
BearerToken       : A...n
```

Display the current values for ApiKey, ApiSecret, AccessToken, AccessTokenSecret, and BearerToken.

Note: The output is truncated. Your values will be unique with a greater length.

## PARAMETERS

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

### BluebirdPS.TwitterAuthentication

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Authentication/Show-TwitterAuthentication)

[Set-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.4/Authentication/Set-TwitterAuthentication)

[Import-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.4/Authentication/Import-TwitterAuthentication)

[Export-TwitterAuthentication](https://docs.bluebirdps.dev/en/v0.8.4/Authentication/Export-TwitterAuthentication)
