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

# Information Stream and History

The execution results of commands that connect to the Twitter API are written to PowerShell's information stream.
These results contains the command name, HTTP method, URL, OAuth Version, HTTP Status, API response, endpoint rate limit details, and more.

The same data is also written to the a history record that is only maintained for the current session.
Reimporting the module will reset the command history.

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

Import-BluebirdPSConfiguration

Set-BluebirdPSConfiguration

Export-BluebirdPSConfiguration

Get-BluebirdPSConfiguration

Get-BluebirdPSHistory

ConvertFrom-EpochTime

Set-Retweet

Publish-Tweet

Search-Tweet

Get-Tweet

Set-TweetLike

Get-TweetLikes

Get-TweetPoll

Set-TweetReply

Get-TwitterAccountSettings

Get-TwitterApiEndpoint

Import-TwitterAuthentication

Set-TwitterAuthentication

Test-TwitterAuthentication

Export-TwitterAuthentication

Set-TwitterBearerToken

Get-TwitterBlockedUser

Set-TwitterBlockedUser

Get-TwitterDM

Publish-TwitterDM

Unpublish-TwitterDM

Get-TwitterFollowers

Remove-TwitterFriend

Add-TwitterFriend

Get-TwitterFriends

Get-TwitterFriendship

Add-TwitterList

Get-TwitterList

Set-TwitterList

Remove-TwitterList

Get-TwitterListByOwner

Add-TwitterListMember

Get-TwitterListMember

Remove-TwitterListMember

Get-TwitterListMembership

Test-TwitterListMembership

Get-TwitterListSubscriber

Remove-TwitterListSubscription

Add-TwitterListSubscription

Test-TwitterListSubscription

Get-TwitterListSubscription

Get-TwitterListTweets

Send-TwitterMedia

Get-TwitterMutedUser

Set-TwitterMutedUser

Get-TwitterPermissions

Get-TwitterRateLimitStatus

Invoke-TwitterRequest

Get-TwitterSavedSearch

Add-TwitterSavedSearch

Remove-TwitterSavedSearch

Get-TwitterTimeline

Get-TwitterUser

Submit-TwitterUserAsSpam

Get-TwitterUserProfileBanner

ConvertFrom-TwitterV1Date
