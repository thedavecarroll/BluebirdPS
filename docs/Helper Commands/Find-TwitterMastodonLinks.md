---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.0/Helper%20Commands/Find-TwitterMastodonLinks
schema: 2.0.0
---

# Find-TwitterMastodonLinks

## SYNOPSIS

This command will search through a list of Twitter User objects and Tweet objects for any Mastodon account references.

## SYNTAX

```powershell
Find-TwitterMastodonLinks [-TwitterObject] <TwitterObject[]> [[-IgnoreUrl] <String[]>] [<CommonParameters>]
```

## DESCRIPTION

This command will search through a list of Twitter User objects and Tweet objects for any Mastodon account references.

For Users, matches will be discovered in any part of the Name, Description, or included Urls.
For Tweets, matches will be discovered in the Tweet Text or included Urls.

The output of this command can be saved to a CSV that can be used to import discovered Mastodon accounts into your instances following list.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-TwitterUser | Find-TwitterMastodonLinks
```

```text
TwitterUserName        : thedavecarroll
TwitterUser            : Dave Carroll
TwitterUrl             : https://twitter.com/thedavecarroll
TwitterElement         : Description
MastodonUser           : @thedavecarroll
MastodonInstance       : counter.social
MastodonAccountAddress : @thedavecarroll@counter.social
MastodonUrl            :

TwitterUserName        : thedavecarroll
TwitterUser            : Dave Carroll
TwitterUrl             : https://twitter.com/thedavecarroll
TwitterElement         : UrlEntity
MastodonUser           : @thedavecarroll
MastodonInstance       : fosstodon.org
MastodonAccountAddress : @thedavecarroll@fosstodon.org
MastodonUrl            : https://fosstodon.org/@thedavecarroll
```

Retrieve the authenticated user and search for Mastodon account references.

### Example 2

```powershell
PS C:\> Get-TwitterFriends | Find-TwitterMastodonLinks | Select-Object @{l='Account address';e={$_.MastodonAccountAddress}},@{l='Show boosts';e={$true}} | Export-Csv -NoTypeInformation -Path .\MastodonImport.csv
```

Retrieves the following list of the authenticated user, searches for Mastodon account references, formats the output to what is required for Mastodon import, and saves the output to a CSV file.

## PARAMETERS

### -IgnoreUrl

Some Urls are similar to Mastodon account references. You can use this parameter to include a list of domains to ignore.

The default value is 'youtube.com', as the new handles for YouTube creators are in the format of youtube.com/@handle.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 'youtube.com'
Accept pipeline input: False
Accept wildcard characters: False
```

### -TwitterObject

A list of Twitter Users or Tweets.

For Tweets, whatever command you use to get the list of Tweets, using -IncludeExpansions will include the Tweet author User object which will be used to correlate the Tweet to a specific User.

```yaml
Type: BluebirdPS.TwitterObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### BluebirdPS.TwitterObject[]

## OUTPUTS

### BluebirdPS.TwitterMastodonReference[]

## NOTES

## RELATED LINKS

[Online Version](https://docs.bluebirdps.dev/en/v0.8.0/Helper%20Commands/Find-TwitterMastodonLinks)
