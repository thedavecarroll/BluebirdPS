---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike
schema: 2.0.0
---

# Set-TweetLike

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Like (Default)
```
Set-TweetLike -TweetId <Int64> [-Like] [-ExcludeEntities] [<CommonParameters>]
```

### Unlike
```
Set-TweetLike -TweetId <Int64> [-Unlike] [-ExcludeEntities] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS > {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ExcludeEntities

Exclude the entities node.

This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Like
{{ Fill Like Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Like
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TweetId

The numerical ID of the desired Tweet.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: Id)

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unlike
{{ Fill Unlike Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Unlike
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

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Tweets/Set-TweetLike)
