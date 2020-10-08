# Repo for Discussion and writing of new PowerShell Twitter module

This repo was created to discuss and write a new PowerShell Twitter module.

## Work in Progress

Please consider this a work in progress.
At this point, anything and everything could changed.

Also, expect errors, though I have tried to keep those at minimum.

## Pre-requisites

* Apply for a developer account [here](https://developer.twitter.com/en/apply/user.html)
  * API Key
  * API Secret
  * Access Token
  * Access Token Secret
* PowerShell 7

## Examples

```PowerShell
$OAuth = @{
    ApiKey = '##########################'
    ApiSecret = '####################################################'
    AccessToken = '####################################################'
    AccessTokenSecret = '#############################################'
}

Search-Tweet -SearchString "(from:rtpsug)" -MaxResults 100
```

## Current Capabilities

### Public functions

Here is list of current public functions.

* Get-SendMediaStatus
* Get-Tweet
* Get-TweetLikes
* Get-TwitterAccountSettings
* Get-TwitterApiEndpoint
* Get-TwitterBlocks
* Get-TwitterConfiguration
* Get-TwitterFollowers
* Get-TwitterFriend
* Get-TwitterFriendship
* Get-TwitterLanguages
* Get-TwitterList
* Get-TwitterListByOwner
* Get-TwitterMutedUser
* Get-TwitterRateLimitStatus
* Get-TwitterRateLimitWarning
* Get-TwitterSavedSearches
* Get-TwitterTimeline
* Get-TwitterUser
* Get-TwitterUserList
* Get-TwitterUserProfileBanner
* Search-Tweet
* Send-TwitterMedia
* Set-Retweet
* Set-TweetLike
* Set-TwitterRateLimitWarning
* Unpublish-TwitterDM

#### Command Verbs

|Verb|Usage|Example|
|-|-|-|
|Get|Get a resource|`Get-TwitterTimeLine -Home`|
|Publish|Tweet or Direct Message|`Publish-Tweet -TweetText 'Check out this pic of #Snoopy' -MediaId $UploadedPic.media_id`|
|Unpublish|Delete Tweet or Direct Message|`Unpublish-TwitterDM -DirectMessageId 1239876543210147852`|
|Set|Like, Unlink, Retweet, Unretweet|`Set-Tweet -Id 12345567896321478 -Like`|
|Search|Text search for a user or tweet|`Search-Tweet -SearchString '#PSTweetChat'`|
|Send|Send media|`Send-TwitterMedia -Path $PathToImage -Category TweetImage -AltImageText 'A bowl of froot loops'`|

### Private Functions

#### API Calls

The module has three functions that will make API calls dependent on if it's a single request,
a cursored request, or a paged request.

* Invoke-TwitterCursorRequest
* Invoke-TwitterPageRequest
* Invoke-TwitterRequest

#### Responses

The `Write-TwitterResponseData` function handles all of the non-error output, which includes
sending key response data to the Information stream.

For the most part, the output is the response from `Invoke-Method`.
The output of some commands contains only the property that's required which should always
be an array of other others.

The function that handles errors, `New-TwitterErrorRecord`, also sends response data to the
Information stream.

## Authentication

### OAuthParameters Class

The cornerstone of the module is the `[OAuthParameters]` class which handles moving the URL and query
to `Invoke-TwitterRequest`.
It's primary function (method, actually) is to generate the OAuth signature string.

### Developer Account Tokens

Currently, any user of the module would need to apply for a Twitter Developer account and create
an application in the portal.

Until we add a `Set-OAuthTokens` or similar function, you will need to have a global variable called `$OAuth`.
It should contain a hashtable as you see below.

```powershell
$OAuth = @{
    ApiKey = '##########################'
    ApiSecret = '####################################################'
    AccessToken = '####################################################'
    AccessTokenSecret = '#############################################'
}
```

## Things to Do

There is still a considerable amount of work to be done before this can get to the PSGallery.

* Proper module scaffolding
* Pester tests
* Help
  * Possibly external-based XML using PlatyPS with docs on ReadTheDocs
* TweetText processor (currently there no check for length)
* Exploration of PIN-OAuth
  * This will entail a security discussion on key storage
* Additional commands
  * Such as `Set-TwitterAuthentication`, `Get-TwitterList`, `Publish-TweetThread`