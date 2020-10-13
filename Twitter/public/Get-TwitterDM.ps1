function Get-TwitterDM {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [Alias('Id')]
        [string]$DirectMessageId,
        [ValidateRange(1,50)]
        [int]$Count = 20
    )

    if ($PSBoundParameters.ContainsKey('DirectMessageId')) {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/direct_messages/events/show.json',
            @{'id' = $DirectMessageId; 'count' = $Count}
        )

        Invoke-TwitterRequest -OAuthParameters $OAuthParameters

    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/direct_messages/events/list.json',
            @{'count'= $Count }
        )

        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue events
    }
}
