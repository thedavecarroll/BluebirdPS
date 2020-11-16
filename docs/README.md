# BluebirdPS

Welcome to the online documentation for BluebirdPS, a Twitter automation client for PowerShell 7.

## Work in Progress

Please consider this a work in progress.
At this point, anything and everything could changed.

Also, expect errors, though I have tried to keep those at minimum.

>This module is nearing readiness to be published to the PowerShell Gallery.
>If you want to be notified when it is published, please use the GitHub Watch feature for the repo.

## Renamed and Rehomed

In order to better support the module, including setting up a external documentation,
the module was renamed from `Twitter` to `BluebirdPS` and moved to my personal account.
Originally, it was created in the PowerShellModules organization and it was the only recent activity.

This module is still very much developed for the community and will gladly accept feedback from the
community to make this module do what you need it to do, while adhering to the Twitter API design and
PowerShell best practices.

## Examples

```PowerShell
(Search-Tweet -SearchString "(from:rtpsug)" -MaxResults 100).statuses

Get-TwitterListByOwner -ScreenName thedavecarroll

Publish-Tweet -TweetText "Continuing work on the #PowerShell Twitter module. Check it out! http://bit.ly/PwshTwitterModule"
```

### More Than Meets the Eye

This module includes output to the Information stream containing details on the call (or calls) made to Twitter.

Here is an example of how to access it and what it contains.

```powershell
$ListMember = Get-TwitterListMember -Slug mylist -OwnerScreenName myscreenname -ResutsPerPage 100 -InformationVariable MyListMemberInfo
$MyListMemberInfo.MessageData
```

Output:

```console
Command            : Get-TwitterListMember
HttpMethod         : GET
Uri                : https://api.twitter.com/1.1/lists/members.json
QueryString        : ?count=100&cursor=-1&include_entities=true&owner_screen_name=ossia&slug=devafter30
Status             : 200 OK
Server             : tsa_b
ResponseTime       : 801
RateLimit          : 900
RateLimitRemaining : 819
RateLimitReset     : 10/13/2020 12:50:37 PM
Response           : {[Cache-Control, System.String[]], [Date, System.String[]], [Pragma, System.String[]], [Server, System.String[]]…}

Command            : Get-TwitterListMember
HttpMethod         : GET
Uri                : https://api.twitter.com/1.1/lists/members.json
QueryString        : ?count=100&cursor=4611686020715031288&include_entities=true&owner_screen_name=ossia&slug=devafter30
Status             : 200 OK
Server             : tsa_b
ResponseTime       : 849
RateLimit          : 900
RateLimitRemaining : 818
RateLimitReset     : 10/13/2020 12:50:37 PM
Response           : {[Cache-Control, System.String[]], [Date, System.String[]], [Pragma, System.String[]], [Server, System.String[]]…}

<truncated>
```

The `Response` property contains the raw response from Twitter.
This function uses `Invoke-TwitterCursorRequest`, which takes the next cursor from the returned payload and appends the query appropriately.

You can see the `ResponseTime` (in milliseconds) along with *RateLimit* specifics.

## Public functions

Here is list of current public functions.

### Authentication

* Set-TwitterAuthentication
* Test-TwitterAuthentication
* Export-TwitterAuthentication
* Import-TwitterAuthentication
* Set-TwitterBearerToken

`Set-TwitterBearerToken` will be used to set the OAuth v2 bearer token used for some Twitter API v2 endpoints.

### Tweets

* Publish-Tweet
* Get-Tweet
* Publish-ReplyTweet
* Set-Retweet
* Set-TweetLike
* Get-TweetLikes

### Users, Followers, Friends, and Blocks

* Get-TwitterTimeline
* Get-TwitterUser
* Get-TwitterUserList
* Get-TwitterFollowers
* Get-TwitterFriends
* Get-TwitterFriendship
* Get-TwitterMutedUser
* Get-TwitterBlocks

### Lists

* Get-TwitterList
* Get-TwitterListByOwner
* Get-TwitterListMember
* Get-TwitterListSubscriber
* Get-TwitterListSubscription
* Get-TwitterListTweets

### Searches

* Search-Tweet
* Get-TwitterSavedSearch
* Add-TwitterSavedSearch
* Remove-TwitterSavedSearch

### Media

* Send-TwitterMedia
* Get-SendMediaStatus

### Direct Message

* Get-TwitterDM
* Publish-TwitterDM
* Unpublish-TwitterDM

### User Profile

* Get-TwitterUserProfileBanner

### Supporting Commands

* Get-TwitterAccountSettings
* Get-TwitterConfiguration
* Get-TwitterLanguages
* Get-TwitterRateLimitStatus

### Helper Commands

These functions do not connect to Twitter directly.

* New-TwitterQuery
* Set-TwitterRateLimitWarning
* Get-TwitterRateLimitWarning
* Get-TwitterApiEndpoint
* Get-TwitterHistory
* Export-TwitterResource
* Test-SearchString

## Command Verbs

|Verb|Usage|Example|
|-|-|-|
|Get|Get a resource|`Get-TwitterTimeLine -Home`|
|Publish|Tweet or Direct Message|`Publish-Tweet -TweetText 'Check out this pic of #Snoopy' -MediaId $UploadedPic.media_id`|
|Unpublish|Delete Tweet or Direct Message|`Unpublish-TwitterDM -DirectMessageId 1239876543210147852`|
|Set|Like, Unlink, Retweet, Unretweet|`Set-Tweet -Id 12345567896321478 -Like`|
|Search|Text search for a user or tweet|`Search-Tweet -SearchString '#PSTweetChat'`|
|Send|Send media|`Send-TwitterMedia -Path $PathToImage -Category TweetImage -AltImageText 'A bowl of froot loops'`|

## Private Functions

### API Calls

The module has three functions that will make API calls dependent on if it's a single request,
a cursored request, or a paged request.

* Invoke-TwitterCursorRequest
* Invoke-TwitterPageRequest
* Invoke-TwitterRequest

### Responses

The `Write-TwitterResponseData` function handles all of the non-error output, which includes
sending key response data to the Information stream.

For the most part, the output is the response from `Invoke-Method`.
The output of some commands contains only the property that's required which should always
be an array of other others.

The function that handles errors, `New-TwitterErrorRecord`, also sends response data to the
Information stream.

## API Authentication

### OAuthParameters Class

The cornerstone of the module is the `[OAuthParameters]` class which handles moving the URL and query
to `Invoke-TwitterRequest`.
It's primary function (method, actually) is to generate the OAuth signature string.

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
* Twitter API V2 Endpoints
