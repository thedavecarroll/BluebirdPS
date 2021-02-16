function Publish-Tweet {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(Mandatory)]
        [string]$TweetText,
        [Parameter(ParameterSetName='Reply')]
        [long]$ReplyToTweet,
        [object[]]$MediaId
    )

    # https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-update
    # maximum of 4 pics, or 1 gif, or 1 video

    # count $TweetText characters
    # if the count is greater than allowed, suggest Send-TweetThread and fail
    # Get-TwitterConfiguration

    $Query = [hashtable]::new()
    $Query.Add('status', [System.Uri]::EscapeDataString($TweetText))

    if ($PSCmdlet.ParameterSetName -eq 'Reply') {
        $Query.Add('in_reply_to_status_id', $ReplyToTweet)

        # this will use the tweet id to get the screen_name and append it to the @mentions until @mentions have reached the limit.
        $Query.Add('auto_populate_reply_metadata', 'true')
    }

    if ($MediaId.Count -gt 0) {
        $Query.Add('media_ids', ($MediaId -join ','))
    }

    $OAuthParameters = [OAuthParameters]::new(
        'POST',
        'https://api.twitter.com/1.1/statuses/update.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
