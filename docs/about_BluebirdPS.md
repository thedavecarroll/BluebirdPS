# about_BluebirdPS

## about_BluebirdPS

# Short Description

BluebirdPS is a Twitter Automation Client for PowerShell 7. Tweet, retweet, send direct messages, manage lists, and more.

# Long Description

With BluebirdPS, you can interact with many Twitter API endpoints without needing to craft complicated requests.
You can search for a Tweet, retrieve one or more Tweets you specify, publish or delete a Tweet, like or unlike a Tweet, and retweet or delete a retweet.
For users, you can retrieve one or users you specify, manage your friends (following) and followers, and manage muted and blocked users.
BluebirdPS also gives you the ability to manage Twitter lists, including membership and retrieving subscribers.
You can send a Direct Message to a user, retrieve DMs, delete a DM, and manage saved searches.

BluebirdPS provides you with an easy interface to Twitter.

# Developer Access

In order to use BluebirdPS, or any other Twitter API client or library, you will need to go through several steps to gain access to the API.

### Applying for a Developer Account

You must apply for a developer account at https://developer.twitter.com/en/apply-for-access.
This process could take a couple weeks.

### Activate Developer Portal

Next, activate your developer portal at https://developer.twitter.com/content/developer-twitter/en/portal/opt-in.

### Create a Project and Register a Developer App

You must have a project with a developer app created in the portal.

### Apply for Access for the Twitter API v2: Early Access

Visit the Twitter API Getting Started page, at https://developer.twitter.com/en/docs/twitter-api/getting-started/about-twitter-api, for details and additional links.

### Generate Account Tokens

From the portal, you will need to generate the consumer key, otherwise called the API Key and Secret.
The API Key is linked to your application.

You will also need to generate an Access Token and Secret.
The Access Token is linked to your Twitter user account.

The application must be given access permissions of Read, Write, and Direct Message for full usage.
At minimum, the application needs Read access for any Get- commands.
Set-, Send-, and Publish-Tweet require Write access, while *-TwitterDM requires Direct Message access.

You can also generate a Bearer Token through the portal, or simply use the Set-TwitterAuthentication command.
If your credentials are validated, the bearer token will be requested and set in the authentication file, as well.

### Example

Set-TwitterAuthentication

# Information Stream and Response History

The execution results of commands that connect to the Twitter API are written to PowerShell's information stream for each API call.
These results contains the command name, HTTP method, URL, OAuth Version, HTTP Status, API response, endpoint rate limit details, and other details.
Each result is also added to a list that can be obtained using the command `Get-BluebirdPSHistory`.

```text
Beginning with v0.8.2, the same data is available in the session variable
$BluebirdPSLastResponse.
```

### Example

$BluebirdPSLastResponse

### Example (Last 5 commands sent to Twitter)

Get-BluebirdPSHistory -Last 5

### Example (Last command with error details)

Get-BluebirdPSHistory -Last 1 -Errors

# Supported Twitter API Endpoints

While a few commands in this module are helper commands that don't connect to the Twitter API, the majority of commands do.
For completeness of documentation, the developer has included definitions of the API endpoints that are currently supported.
The command Get-TwitterApiEndpoint can help you discover which command to use for a specific API endpoint.

### Example

Get-TwitterApiEndpoint -Endpoint lists

# New Features

More features are on the way but if you have a use case that the module does not support, please submit a feature request at https://bit.ly/BluebirdPSFeatureRequest.

# Found a Bug?

If you find a bug, please report it at https://bit.ly/BluebirdPSBugReport.

# Join the Discussion

Ask a question or pose a topic at https://bit.ly/BluebirdPSDiscussion.

# Keywords

Twitter

TwitterAPI

TwitterAPIv2

Add-TwitterFriend

Add-TwitterList

Add-TwitterListMember

Add-TwitterListSubscription

Add-TwitterSavedSearch

ConvertFrom-EpochTime

ConvertFrom-TwitterV1Date

Export-BluebirdPSConfiguration

Export-TwitterAuthentication

Find-TwitterMastodonLinks

Get-BluebirdPSAssemblyDetails

Get-BluebirdPSConfiguration

Get-BluebirdPSHistory

Get-BluebirdPSVersion

Get-Tweet

Get-TweetConversation

Get-TweetCount

Get-TweetLikes

Get-TweetPoll

Get-TwitterAccountSettings

Get-TwitterApiEndpoint

Get-TwitterBlockedUser

Get-TwitterDM

Get-TwitterFollowers

Get-TwitterFriends

Get-TwitterFriendship

Get-TwitterList

Get-TwitterListMember

Get-TwitterListMembership

Get-TwitterListSubscriber

Get-TwitterListSubscription

Get-TwitterListTweets

Get-TwitterMutedUser

Get-TwitterPermissions

Get-TwitterPinnedList

Get-TwitterRateLimitStatus

Get-TwitterSavedSearch

Get-TwitterTimeline

Get-TwitterUser

Get-TwitterUserProfileBanner

Import-BluebirdPSConfiguration

Import-TwitterAuthentication

Invoke-TwitterRequest

Publish-Tweet

Publish-TwitterDM

Remove-TwitterFriend

Remove-TwitterList

Remove-TwitterListMember

Remove-TwitterListSubscription

Remove-TwitterSavedSearch

Search-Tweet

Send-TwitterMedia

Set-BluebirdPSConfiguration

Set-Retweet

Set-TweetLike

Set-TweetReply

Set-TwitterAuthentication

Set-TwitterBearerToken

Set-TwitterBlockedUser

Set-TwitterList

Set-TwitterMutedUser

Set-TwitterPinnedList

Show-TwitterAuthentication

Submit-TwitterUserAsSpam

Test-TwitterAuthentication

Test-TwitterListMembership

Test-TwitterListSubscription

Unpublish-Tweet

Unpublish-TwitterDM
