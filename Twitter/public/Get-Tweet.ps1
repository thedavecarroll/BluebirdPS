function Get-Tweet {
    [CmdletBinding()]
    param([long]$TweetId)

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/statuses/show.json',
        @{ 'id' = $TweetId }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
