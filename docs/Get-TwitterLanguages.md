---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Get-TwitterLanguages
schema: 2.0.0
---

# Get-TwitterLanguages

## SYNOPSIS

Returns the list of languages supported by Twitter along with the language code supported by Twitter.

## SYNTAX

```powershell
Get-TwitterLanguages [<CommonParameters>]
```

## DESCRIPTION

Returns the list of languages supported by Twitter along with the language code supported by Twitter.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterLanguages
```

```console
code       : fr
name       : French
local_name : français
status     : production
debug      : False

code       : en
name       : English
local_name : English
status     : production
debug      : False

code       : ga
name       : Irish
local_name : Gaeilge
status     : beta
debug      : False

<TRUNCATED>
```

Returns the list of languages supported by Twitter along with the language code supported by Twitter.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Get-TwitterLanguages)
[Api Reference - GET help/languages](https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/supported-languages/api-reference/get-help-languages)
