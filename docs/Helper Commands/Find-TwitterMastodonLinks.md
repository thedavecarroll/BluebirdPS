---
external help file: BluebirdPS-help.xml
Module Name: BluebirdPS
online version: https://docs.bluebirdps.dev/en/v0.8.4/Helper%20Commands/Find-TwitterMastodonLinks
schema: 2.0.0
---

# Find-TwitterMastodonLinks

## SYNOPSIS

This command will search through a list of Twitter User objects and Tweet objects for any Mastodon account references.

## SYNTAX

```powershell
Find-TwitterMastodonLinks [-TwitterObject] <TwitterObject[]> [-IgnoreDomain <String[]>] [<CommonParameters>]
```

## DESCRIPTION

This command will search through a list of Twitter User objects and Tweet objects for any Mastodon account references.

For Users, matches will be discovered in any part of the Name, Description, or included Urls.
For Tweets, matches will be discovered in the Tweet Text or included Urls.

The output of this command can be saved to a CSV that can be used to import discovered Mastodon accounts into your instances following list.

## EXAMPLES

### Example 1

```powershell
PS > Get-TwitterUser | Find-TwitterMastodonLinks
```

```text
TwitterUserName        : thedavecarroll
TwitterUser            : Dave Carroll
TwitterUrl             : https://twitter.com/thedavecarroll
TwitterElement         : UrlEntity
MastodonUser           : @thedavecarroll
MastodonInstance       : fosstodon.org
MastodonAccountAddress : @thedavecarroll@fosstodon.org
MastodonUrl            : https://fosstodon.org/@thedavecarroll
IsValidDomain          : True
```

Retrieve the authenticated user and search for Mastodon account references.

### Example 2

```powershell
PS > Get-TwitterFriends |
    Find-TwitterMastodonLinks -IgnoreDomain @('youtube.com','medium.com','withkoji.com','twitter.com','counter.social') |
    Select-Object @{l='Account address';e={$_.MastodonAccountAddress}},@{l='Show boosts';e={$true}} |
    Export-Csv -NoTypeInformation -Path .\MastodonImport.csv
```

Retrieves the following list of the authenticated user, searches for Mastodon account references, formats the output to what is required for Mastodon import, and saves the output to a CSV file.

## PARAMETERS

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

### -IgnoreDomain

Some Urls are similar to Mastodon account references. You can use this parameter to include a list of domains to ignore.

This parameter is often used to ignore domains that use a similarly structured URI as a Mastodon URL.
If the following domains are not ignored, you will receive errors when you import them into your Mastodon account.

'youtube.com','medium.com','withkoji.com','twitter.com'

Additionally, you may want to ignore valid Mastodon instances that are not part of the Fediverse, such as counter.social, or those that have been defederated.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases: IgnoreUrl

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

[Online Version](https://docs.bluebirdps.dev/en/v0.8.4/Helper%20Commands/Find-TwitterMastodonLinks)
