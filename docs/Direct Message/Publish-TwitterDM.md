---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Publish-TwitterDM
schema: 2.0.0
---

# Publish-TwitterDM

## SYNOPSIS

Publishes a new direct message to a specified user from the authenticating user.

## SYNTAX

```powershell
Publish-TwitterDM [-UserId] <String> [-Message] <String> [[-MediaId] <String>] [<CommonParameters>]
```

## DESCRIPTION

Publishes a new direct message to a specified user from the authenticating user.

## EXAMPLES

### Example 1

```powershell
PS > Publish-TwitterDM -UserId 123456789 -Message "Did you hear about the release of #PowerShell 7.1?"
```

Send the string message to the specified user as a direct message.

## PARAMETERS

### -UserId

The ID of the user to which you want to send a direct message.

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Message

The text of your Direct Message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MediaId

The MediaId returned from the Send-TwitterMedia command.

```yaml
Type: String
Parameter Sets: (All)
Aliases: media_id

Required: False
Position: 2
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Publish-TwitterDM)

[Get-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Get-TwitterDM)

[Unpublish-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Unpublish-TwitterDM)

[Api Reference - GET direct_messages/events/list](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/new-event)
