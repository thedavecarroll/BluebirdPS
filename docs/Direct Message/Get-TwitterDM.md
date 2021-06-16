---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.6.1/Direct%20Message/Get-TwitterDM
schema: 2.0.0
---

# Get-TwitterDM

## SYNOPSIS

Returns one or more direct messages.

## SYNTAX

```powershell
Get-TwitterDM [-Id <String>] [[-Count] <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Returns one or more direct messages.

If the DirectMessageId is omitted, all DMs from the last 30 days will be returned in reverse chronological order.

NOTE: The direct_messages/events/list endpoint has a low rate limit (15) and most likely you will reach this when not specifying a direct message id.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterDM
```

Returns a list of all DMs from the last 30 days.

### Example 2

```powershell
PS > Get-TwitterDM -Id 1396421634874019846
```

```text
Id          : 1396421634874019846
SenderId    : 292670084
RecipientId : 1330877955057344513
CreatedAt   : 5/23/2021 6:03:56 AM
Message     : Testing back https://t.co/oItJzXPiW4
Media       : Id: 1396421586308173827, Type: Photo, DisplayUrl: pic.twitter.com/oItJzXPiW4
SourceAppId : 3033300
```

Returns the direct message specified.

## PARAMETERS

### -Id

The ID of the direct message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageCount

The number of message to retrieve.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True (None) False (All)
Position: 1
Default value:
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### BluebirdPS.APIV1.DirectMessage

### BluebirdPS.APIV1.DirectMessage[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.6.1/Direct%20Message/Get-TwitterDM)

[Publish-TwitterDM](https://docs.bluebirdps.dev/en/v0.6.1/Direct%20Message/Publish-TwitterDM)

[Unpublish-TwitterDM](https://docs.bluebirdps.dev/en/v0.6.1/Direct%20Message/Unpublish-TwitterDM)

[Api Reference - GET direct_messages/events/list](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/list-events)

[Api Reference - GET direct_messages/events/show](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/get-event)
