---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Media/Send-TwitterMedia
schema: 2.0.0
---

# Send-TwitterMedia

## SYNOPSIS

Upload media to Twitter to use in a Tweet or direct message.

## SYNTAX

```powershell
Send-TwitterMedia [-Path] <String> [-Category] <String> [-AltImageText <String>] [<CommonParameters>]
```

## DESCRIPTION

Upload media to Twitter to use in a Tweet or direct message.

You can only upload an image, video, or gif.

NOTE: This command currently returns the raw API response.

## EXAMPLES

### Example 1

```powershell
PS > Send-TwitterMedia -Path .\PSFollowFriday_20210514.png -Category TweetImage -AltImageText 'Creating a PSFollowFriday via PowerShell module BluebirdPS.' -Verbose
```

```text
VERBOSE: Reading file D:\GitHub\PSFollowFriday_20210514.png
VERBOSE: Beginning INIT phase - media size 17004, category tweet_image, type image/png
VERBOSE: Upload for media id 1396858342329524224 successfully initiated
VERBOSE: Beginning APPEND phase
VERBOSE: Beginning FINALIZE phase
VERBOSE: Adding AltImageText to media 1396858342329524224
VERBOSE: Alt image text successfully added to media
VERBOSE: Media upload complete

media_id           : 1396858342329524224
media_id_string    : 1396858342329524224
media_key          : 3_1396858342329524224
size               : 16974
expires_after_secs : 86400
image              : @{image_type=image/png; w=873; h=185}
```

Upload the specified media file and set the ALT text for the media.

## PARAMETERS

### -Path

Specify the full path to the media file.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Category

Specifies the type and use for the uploaded media.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:
Accepted values: TweetImage, TweetVideo, TweetGif, DMImage, DMVideo, DMGif

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AltImageText

Provide additional information about the images or GIFs.

```yaml
Type: System.String
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

### System.String

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Media/Send-TwitterMedia)

[Api Reference - POST media/upload (INIT)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-init)

[Api Reference - POST media/upload (APPEND)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-append)

[Api Reference - POST media/upload (FINALIZE)](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/api-reference/post-media-upload-finalize)

[Api Reference - Upload Media](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/uploading-media/media-best-practices)

[Api Reference - Chunked Media Upload](https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/uploading-media/chunked-media-upload)
