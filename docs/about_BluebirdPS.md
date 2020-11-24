# BluebirdPS

## about_BluebirdPS

# SYNOPSIS

BluebirdPS is a Twitter automation client written for PowerShell 7 and above.

# DESCRIPTION

With BluebirdPS, you can publish a tweet, reply to a tweet, publish a direct message, upload media to use in tweets or direct messages, retweet/unretweet, like/unlike, add/delete saved searches, and retrieve many resources such as blocks, followers, timelines, and users. Additionally, you can retrieve lists, list membership, and list subscribers.

### More Features to come

More features are on the way.

# DEVELOPER ACCOUNT TOKENS

Currently, any user of the module would need to apply for a Twitter Developer account at https://developer.twitter.com/en/apply/user.html and create an application in the portal. Once you have created the application, generate your API key/secret and access token/secret. Then use the following command to add your key, token and secrets. Omit the `-Persist` if you do not want to save your credentials to disk.

### Example

Set-TwitterAuthentication -Persist

# HISTORY AND INFORMATION STREAM

The execution results of commands that connect to the Twitter API are collected in a module variable. The data contained in each record in the command history is the same that is written to the information stream. Some API calls, such as the append call within the Send-TwitterMedia command, may not added to history as there could hundreds of such calls when uploading large videos.

### History Note

THE COMMAND HISTORY DATA ONLY LIVES IN YOUR CURRENT SESSION AND IS NOT TRANSMITTED. If you re-import the module, the history will be reset.

### Example (Last 5 commands sent to Twitter)

Get-TwitterHistory -Last 5

# TWITTER API

While a few commands in this module are helper commands that don't connect to the Twitter API, the majority of commands do. For completeness of documentation, the developer has included definitions of the API endpoints that are currently supported. The command Get-TwitterApiEndpoint can help you discover "under the hood" aspects of each command. The definitions includes the API URL, which is also included in each commands LINKs section.

### Example

Get-TwitterApiEndpoint -Command Get-TwitterTimeline

# KEYWORDS

Twitter

TwitterAPI

Export-TwitterAuthentication

Import-TwitterAuthentication

Set-TwitterAuthentication

Set-TwitterBearerToken

Test-TwitterAuthentication

Get-TwitterDM

Publish-TwitterDM

Unpublish-TwitterDM

Get-TwitterApiEndpoint

Get-TwitterHistory

Get-TwitterRateLimitWarning

Set-TwitterRateLimitWarning

Test-SearchString

Get-TwitterList

Get-TwitterListByOwner

Get-TwitterListMember

Get-TwitterListSubscriber

Get-TwitterListSubscription

Get-TwitterListTweets

Send-TwitterMedia

Add-TwitterSavedSearch

Get-TwitterSavedSearch

Remove-TwitterSavedSearch

Search-Tweet

Export-TwitterResource

Get-TwitterAccountSettings

Get-TwitterConfiguration

Get-TwitterLanguages

Get-TwitterRateLimitStatus

Get-Tweet

Get-TweetLike

Publish-Tweet

Set-Retweet

Set-TweetLike

Get-TwitterUserProfileBanner

Get-TwitterBlocks

Get-TwitterFollowers

Get-TwitterFriends

Get-TwitterFriendship

Get-TwitterMutedUser

Get-TwitterTimeline

Get-TwitterUser

Get-TwitterUserList

