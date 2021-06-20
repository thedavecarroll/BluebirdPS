---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.2/Supporting%20Commands/Get-TwitterPermissions
schema: 2.0.0
---

# Get-TwitterPermissions

## SYNOPSIS

Returns the permissions for the authenticating user.

## SYNTAX

```powershell
Get-TwitterPermissions [<CommonParameters>]
```

## DESCRIPTION

Returns the permissions for the authenticating user.

If you are only able to view data, Get-* commands, or cannot retrieve direct messages, use this to verify your permissions.

Use the Twitter Developer Portal to update your permissions.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterPermissions
```

```text
Read/Write/DirectMessages
```

Returns the permissions for the authenticating user.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.2/Supporting%20Commands/Get-TwitterPermissions)

[Twitter Developer Portal](https://developer.twitter.com/en/portal/dashboard)
