---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.3/Direct%20Message/Publish-TwitterDM
schema: 2.0.0
---

# Publish-TwitterDM

## SYNOPSIS

Publishes a new direct message to a specified user from the authenticating user.

## SYNTAX

### DMUserId (Default)

```powershell
Publish-TwitterDM -Id <string> [-Message <string>] [-MediaId <string>] [<CommonParameters>]
```

### DMUserIdWithMedia

```powershell
Publish-TwitterDM -Id <string> -Path <string> -Category <string> [-Message <string>] [-AltImageText <string>] [<CommonParameters>]
```

### DMUserObjectWithMedia

```powershell
Publish-TwitterDM -User <User> -Path <string> -Category <string> [-Message <string>] [-AltImageText <string>] [<CommonParameters>]
```

### DMUserObject

```powershell
Publish-TwitterDM -User <User> [-Message <string>] [-MediaId <string>] [<CommonParameters>]
```

## DESCRIPTION

Publishes a new direct message to a specified user from the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Publish-TwitterDM -UserId 123456789 -Message "Did you hear about the release of #PowerShell 7.1?"
```

Send the string message to the specified user as a direct message.

### Example 2

```powershell
PS > Get-TwitterUser -User BluebirdPS | Publish-TwitterDM -Message 'Are you excited about the upcoming release of BluebirdPS?' -Path $PathToFile -Category DMImage -AltImageText 'Good to have alt-img-text for screen readers'
```

```text
Id          : 1396582297319747588
SenderId    : 292670084
RecipientId : 1330877955057344513
CreatedAt   : 5/23/2021 4:42:21 PM
Message     : Are you excited about the upcoming release of BluebirdPS? https://t.co/zA8bPmHskI
Media       : Id: 1396582290713686016, Type: Photo, DisplayUrl: pic.twitter.com/zA8bPmHskI
SourceAppId :
```

Send the string message to the specified user as a direct message.

## PARAMETERS

### -Message

The text of your Direct Message.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

Specifies the direct message recipient by Twitter user id.

```yaml
Type: System.String
Parameter Sets: DMUserId, DMUserIdWithMedia
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User

Specifies the direct message recipient by Twitter user object, returned by Get-TwitterUser.

```yaml
Type: BluebirdPS.APIV2.UserInfo.User
Parameter Sets: DMUserObjectWithMedia, DMUserObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: User
Parameter Sets: DMUserObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: System.String
Parameter Sets: DMUserId, DMUserObject
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path

Specify the full path to the media file.

```yaml
Type: System.String
Parameter Sets: DMUserIdWithMedia, DMUserObjectWithMedia
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category

Specifies the type and use for the uploaded media.

```yaml
Type: System.String
Parameter Sets: DMUserIdWithMedia, DMUserObjectWithMedia
Aliases:
Accepted values: DMImage, DMVideo, DMGif

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AltImageText

Provide additional information about the images or GIFs.

```yaml
Type: System.String
Parameter Sets: DMUserIdWithMedia, DMUserObjectWithMedia
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

### BluebirdPS.APIV1.DirectMessage

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.3/Direct%20Message/Publish-TwitterDM)

[Get-TwitterDM](https://docs.bluebirdps.dev/en/v0.8.3/Direct%20Message/Get-TwitterDM)

[Unpublish-TwitterDM](https://docs.bluebirdps.dev/en/v0.8.3/Direct%20Message/Unpublish-TwitterDM)

[Api Reference - GET direct_messages/events/list](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/new-event)
