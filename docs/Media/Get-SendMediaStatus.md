---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Media/Get-SendMediaStatus
schema: 2.0.0
---

# Get-SendMediaStatus

## SYNOPSIS

The Get-SendMediaStatus command is used to periodically poll for updates of media processing operation.

## SYNTAX

```powershell
Get-SendMediaStatus [-MediaId] <String> [<CommonParameters>]
```

## DESCRIPTION

The Get-SendMediaStatus command is used to periodically poll for updates of media processing operation.

After the response returns succeeded, you can move on to the next step which would typically be either Publish-Tweet or Publish-TwitterDM with the MediaId.

## EXAMPLES

### Example 1

```powershell
PS > Get-SendMediaStatus -MediaId 123456789
```

Get the status of the media operation for the media with the specified id.

## PARAMETERS

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: String
Parameter Sets: (All)
Aliases: media_id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Media/Get-SendMediaStatus)

[Send-TwitterMedia](https://bluebirdps.anovelidea.org/en/latest/Media/Send-TwitterMedia)

[Api Reference - GET media/upload](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/get-media-upload-status)
