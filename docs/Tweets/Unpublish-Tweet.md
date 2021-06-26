---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.7.0/Tweets/Unpublish-Tweet
schema: 2.0.0
---

# Unpublish-Tweet

## SYNOPSIS

Delete the specified Tweet.

## SYNTAX

### ById (Default)

```powershell
Unpublish-Tweet -Id <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```

### ByTweet

```powershell
Unpublish-Tweet -Tweet <Tweet> [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Delete the specified Tweet.

The authenticating user must be the author of the specified Tweet.

## EXAMPLES

### Example 1

```powershell
PS > Unpublish-Tweet -Id 1399711831015428097
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Deleting Tweet" on target "Id: 1399711831015428097".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Delete the specified Tweet.

### Example 2

```powershell
PS > Get-Tweet -Id 1399712801862598661 | Unpublish-Tweet
```

```text
Confirm
Are you sure you want to perform this action?
Performing the operation "Deleting Tweet" on target "Id: 1399712801862598661, CreatedAt: 6/1/2021 1:01:52 PM".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Delete the specified Tweet.

## PARAMETERS

### -Id

The id of the Tweet.

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True (ById) False (None)
Position: Named
Default value:
Accept pipeline input: True
Accept wildcard characters: False
```

### -Tweet

The Tweet object to delete.

```yaml
Type: Tweet
Parameter Sets: ByTweet
Aliases:

Required: True (ByTweet) False (None)
Position: Named
Default value:
Accept pipeline input: True
Accept wildcard characters: False
```

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: True (None) False (All)
Position: Named
Default value:
Accept pipeline input: False
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
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

### BluebirdPS.APIV2.TweetInfo.Tweet

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.7.0/Tweets/Unpublish-Tweet)

[Get-Tweet](https://docs.bluebirdps.dev/en/v0.7.0/Tweets/Get-Tweet)

[Publish-Tweet](https://docs.bluebirdps.dev/en/v0.7.0/Tweets/Publish-Tweet)

[API Documentation - POST statuses/destroy/:id](https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id)
