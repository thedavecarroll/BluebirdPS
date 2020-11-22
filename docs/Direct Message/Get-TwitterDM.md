---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Get-TwitterDM
schema: 2.0.0
---

# Get-TwitterDM

## SYNOPSIS

Returns one or more direct messages.

## SYNTAX

```powershell
Get-TwitterDM [[-DirectMessageId] <String>] [[-Count] <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Returns one or more direct messages.

If the DirectMessageId is omitted, all DMs from the last 30 days will be returned in reverse chronological order.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterDM
```

Returns a list of all DMs from the last 30 days.

### Example 2

```powershell
PS > $Message = Get-TwitterDM -DirectMessageId 1326381283837157381
PS > $Message.event.message_create
```

```console
target                   sender_id source_app_id message_data
------                   --------- ------------- ------------
@{recipient_id=00000000} 000000000 129032        @{text=Yeah. Let me write an update. I'll do that now.; entities=}

```

Returns the direct message specified.

## PARAMETERS

### -DirectMessageId

The id of the Direct Message event that should be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count

Specifies the number of results to retrieve.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Get-TwitterDM)

[Publish-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Publish-TwitterDM)

[Unpublish-TwitterDM](https://bluebirdps.anovelidea.org/en/latest/Direct%20Message/Unpublish-TwitterDM)

[Api Reference - GET direct_messages/events/list](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/list-events)

[Api Reference - GET direct_messages/events/show](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/get-event)
