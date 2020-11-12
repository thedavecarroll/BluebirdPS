function Get-Tweet {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [Alias('Id')]
        [ValidateNotNullOrEmpty()]
        [long]$TweetId
    )

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/statuses/show.json',
        @{ 'id' = $TweetId }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters

}
