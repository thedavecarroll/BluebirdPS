---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Get-TwitterApiEndpoint
schema: 2.0.0
---

# Get-TwitterApiEndpoint

## SYNOPSIS

Get a list of the module's commands or an array of commands, with the associated Twitter API endpoints (as used in the command) and documentation links.

## SYNTAX

```powershell
Get-TwitterApiEndpoint [[-CommandName] <String[]>] [[-Endpoint] <String>] [<CommonParameters>]
```

## DESCRIPTION

Get a list of the module's commands or an array of commands, with the associated Twitter API endpoints and documentation links.

Some commands may act against more than one endpoint, depending on the parameters used.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterApiEndpoint -CommandName Get-TwitterList | Format-List
```

```text
CommandName      : Get-TwitterList
Visibility       : Public
ApiEndpoint      : {GET lists/list, GET lists/show}
ApiDocumentation : {https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list, https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show}
```

Display details for the command Get-TwitterList.

### Example 2

```powershell
PS > Get-TwitterApiEndpoint -Endpoint saved | Format-List
```

```text
CommandName      : Add-TwitterSavedSearch
Visibility       : Public
ApiEndpoint      : POST saved_searches/create
ApiDocumentation : https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create

CommandName      : Get-TwitterSavedSearch
Visibility       : Public
ApiEndpoint      : {GET saved_searches/list, GET saved_searches/show/:id}
ApiDocumentation : {https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list, https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list}

CommandName      : Remove-TwitterSavedSearch
Visibility       : Public
ApiEndpoint      : POST saved_searches/destroy/:id
ApiDocumentation : https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-destroy-id
```

Display all commands whose endpoint contains the word 'saved'.

## PARAMETERS

### -CommandName

Specifies the name of the BluebirdPS command.

Tab completion is enabled for this parameter for public functions.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Endpoint

The endpoint or part of the endpoint string.

Specifying the endpoint will allow the user to discover commands that are included in BluebirdPS.

The user may still be able to access endpoints, which are currently not supported by the module, by using the Invoke-TwitterRequest command.
See the contextual help about_BluebirdPS_TwitterRequest for more details.

```yaml
Type: String
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

### System.String

## OUTPUTS

### BluebirdPS.EndpointInfo

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.5.1/Helper%20Commands/Get-TwitterApiEndpoint)

[Invoke-TwitterRequest](https://docs.bluebirdps.dev/en/v0.5.1/Supporting%20Commands/Invoke-TwitterRequest)