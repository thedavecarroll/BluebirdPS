---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterApiEndpoint
schema: 2.0.0
---

# Get-TwitterApiEndpoint

## SYNOPSIS

Displays the Twitter Api endpoint metadata for endpoints supported by this module.

## SYNTAX

### Resource (Default)

```powershell
Get-TwitterApiEndpoint [[-Resource] <String[]>] [<CommonParameters>]
```

### Command

```powershell
Get-TwitterApiEndpoint [-Command <String>] [<CommonParameters>]
```

## DESCRIPTION

Displays the Twitter Api endpoint metadata for endpoints supported by this module.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterApiEndpoint -Resource help
```

```console
Endpoint     : GET help/configuration
Function     : Get-TwitterConfiguration
ApiVersion   : v1.1
Resource     : help/configuration
Method       : GET
Uri          : https://api.twitter.com/1.1/help/configuration.json
ApiReference : https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/configuration/api-reference/get-help-configuration
Description  : Returns the current configuration used by Twitter including twitter.com slugs which are not usernames, maximum photo resolutions, and t.co shortened URL length.
               It is recommended applications request this endpoint when they are loaded, but no more than once a day.
Iteration    : None
Parameters   :

Endpoint     : GET help/languages
Function     : Get-TwitterLanguages
ApiVersion   : v1.1
Resource     : help/languages
Method       : GET
Uri          : https://api.twitter.com/1.1/help/languages.json
ApiReference : https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/supported-languages/api-reference/get-help-languages
Description  : Returns the list of languages supported by Twitter along with the language code supported by Twitter.
                       The language code may be formatted as ISO 639-1 alpha-2 (en), ISO 639-3 alpha-3 (msa), or ISO 639-1 alpha-2 combined with an ISO 3166-1 alpha-2 localization (zh-tw)
Iteration    : None
Parameters   :
```

Display the endpoint metadata for the specified endpoint.

### Example 2

```powershell
PS > Get-TwitterApiEndpoint -Resource friends,followers,friendships
```

Display the endpoint metadata for the specified endpoints.

### Example 3

```powershell
PS > Get-TwitterApiEndpoint -Command Send-TwitterMedia
```

Display the endpoint metadata for the command `Send-TwitterMedia`.

## PARAMETERS

### -Resource

Specifies the resource category of API endpoint that will be displayed.

```yaml
Type: String[]
Parameter Sets: Resource
Aliases:
Accepted values: account, application, blocks, direct_messages, favorites, followers, friends, friendships, help, lists, media, mutes, oauth2, saved_searches, search, statuses, users
Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Command

Specifies the name of the module's function which to display the metadata for the API endpoint(s).

```yaml
Type: String
Parameter Sets: Command
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

[Online Version](https://bluebirdps.anovelidea.org/en/latest/Helper%20Commands/Get-TwitterApiEndpoint)
