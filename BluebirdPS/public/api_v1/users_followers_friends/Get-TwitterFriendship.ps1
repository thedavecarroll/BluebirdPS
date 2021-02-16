function Get-TwitterFriendship {
    [CmdletBinding(DefaultParameterSetName='LookupScreenName')]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='LookupScreenName')]
        [ValidateCount(1,100)]
        [string[]]$ScreenName,

        [Parameter(Mandatory,ValueFromPipeline,ParameterSetName='LookupUserId')]
        [ValidateCount(1,100)]
        [int[]]$UserId,

        [Parameter(Mandatory,ParameterSetName='ShowScreenName')]
        [string]$SourceScreenName,

        [Parameter(Mandatory,ParameterSetName='ShowUserId')]
        [int]$SourceUserId,

        [Parameter(Mandatory,ParameterSetName='ShowScreenName')]
        [string]$TargetScreenName,

        [Parameter(Mandatory,ParameterSetName='ShowUserId')]
        [int]$TargetUserId,

        [Parameter(ParameterSetName='Incoming')]
        [switch]$Incoming,

        [Parameter(ParameterSetName='Pending')]
        [switch]$Pending,

        [Parameter(ParameterSetName='NoRetweets')]
        [switch]$NoRetweets

    )

    switch -Regex ($PSCmdlet.ParameterSetName) {
        'Lookup' {
            $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/lookup.json',
                $Query
            )
            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
        'Show' {
            $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/show.json',
                $Query
            )
            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
        'Incoming' {
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/incoming.json',
                @{ cursor = -1 }
            )
            Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue ids
        }
        'Pending' {
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/outgoing.json',
                @{ cursor = -1 }
            )
            Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue ids
        }
        'NoRetweets' {
            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/no_retweets/ids.json'
            )
            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
    }
}
