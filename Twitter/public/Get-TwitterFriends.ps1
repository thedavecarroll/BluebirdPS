function Get-TwitterFriends {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [string]$ScreenName,
        [string]$UserId,
        [int]$ResultsPerPage,

        [Parameter(ParameterSetName='List')]
        [switch]$List,

        [Parameter(ParameterSetName='List')]
        [switch]$SkipStatus,

        [Parameter(ParameterSetName='List')]
        [switch]$ExcludeEntities
    )

    if ([string]::IsNullOrWhiteSpace($ScreenName) -and [string]::IsNullOrWhiteSpace($UserId)) {
        'You must supply either a ScreenName or UserId' | Write-Warning
        return
    } elseif ($ScreenName.Length -gt 0 -and $UserId.Length -gt 0) {
        'You must supply a ScreenName or a UserId, but not both' | Write-Warning
        return
    }

    if ($PSCmdlet.ParameterSetName -eq 'List') {
        if ($ResultsPerPage -and $ResultsPerPage -notin 1..200) {
            'For a list of follower objects, you can only request up to 200 user objects per page.' | Write-Warning
            return
        } else {
            $ResultsPerPage = 100
        }
    } else {
        if ($ResultsPerPage -and $ResultsPerPage -notin 1..5000) {
            'For list of follower ids, you can only request up to 5000 user is per page.' | Write-Warning
            return
        } else {
            $ResultsPerPage = 5000
        }
    }

    if ($PSCmdlet.ParameterSetName -eq 'List') {
        $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
        $OAuthParameters = [OAuthParameters]::new(
            'Get',
            'https://api.twitter.com/1.1/friends/list.json',
            $Query
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue users

    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'Get',
            'https://api.twitter.com/1.1/friends/ids.json',
            @{ cursor = -1}
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue ids
    }
}
