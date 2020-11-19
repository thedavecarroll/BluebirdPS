---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Unpublish-TwitterDM
schema: 2.0.0
---

# Unpublish-TwitterDM

## SYNOPSIS

Deletes the direct message specified by the DirectMessageId parameter.

## SYNTAX

```powershell
Unpublish-TwitterDM [-DirectMessageId] <String> [<CommonParameters>]
```

## DESCRIPTION

Deletes the direct message specified by the DirectMessageId parameter.

The authenticating user must be the recipient of the specified direct message.
Direct Messages are only removed from the interface of the user context provided.
Other members of the conversation can still access the Direct Messages.

## EXAMPLES

### Example 1

```powershell
PS > Unpublish-TwitterDM -DirectMessageId 9876543210123
```

Deletes the direct message specified by the DirectMessageId parameter.

## PARAMETERS

### -DirectMessageId

The id of the Direct Message event that should be deleted.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Unpublish-TwitterDM)

[Get-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Get-TwitterDM)

[Publish-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Publish-TwitterDM)

[Api Reference - DELETE direct_messages/events/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/delete-message-event)
