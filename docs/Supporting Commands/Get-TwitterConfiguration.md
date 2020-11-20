---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Get-TwitterConfiguration
schema: 2.0.0
---

# Get-TwitterConfiguration

## SYNOPSIS

Returns the current configuration used by Twitter including twitter.com slugs which are not usernames, maximum photo resolutions, and t.co shortened URL length.

## SYNTAX

```powershell
Get-TwitterConfiguration [<CommonParameters>]
```

## DESCRIPTION

Returns the current configuration used by Twitter including twitter.com slugs which are not usernames, maximum photo resolutions, and t.co shortened URL length.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterConfiguration
```

```console
dm_text_character_limit       : 10000
characters_reserved_per_media : 24
max_media_per_upload          : 1
non_username_paths            : {about, account, accounts, activityΓÇª}
photo_size_limit              : 3145728
photo_sizes                   : @{thumb=; small=; medium=; large=}
short_url_length              : 23
short_url_length_https        : 23
```

Returns the current configuration used by Twitter.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Supporting%20Commands/Get-TwitterConfiguration)

[Api Reference - GET help/configuration](https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/configuration/api-reference/get-help-configuration)
