---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Direct%20Message/Unpublish-TwitterDM
schema: 2.0.0
---

# Unpublish-TwitterDM

## SYNOPSIS

Deletes the direct message specified by the DirectMessageId parameter.

## SYNTAX

```powershell
Unpublish-TwitterDM -Id <String> [-WhatIf] [-Confirm] [<CommonParameters>]
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

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id

The ID of the direct message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

### BluebirdPS.APIV1.DirectMessage

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Direct%20Message/Unpublish-TwitterDM)

[Get-TwitterDM](https://docs.bluebirdps.dev/en/v0.7.0/Direct%20Message/Get-TwitterDM)

[Publish-TwitterDM](https://docs.bluebirdps.dev/en/v0.7.0/Direct%20Message/Publish-TwitterDM)

[Api Reference - DELETE direct_messages/events/destroy](https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/delete-message-event)
