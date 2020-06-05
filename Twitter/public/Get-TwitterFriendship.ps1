function Get-TwitterFriendship {
    [CmdletBinding(DefaultParameterSetName='Lookup')]
    param(
        [Parameter(ParameterSetName='Lookup')]
        [string[]]$ScreenName,
        [Parameter(ParameterSetName='Lookup')]
        [string[]]$UserId,

        [Parameter(ParameterSetName='Show')]
        [string]$SourceScreenName,
        [Parameter(ParameterSetName='Show')]
        [string]$SourceUserId,
        [Parameter(ParameterSetName='Show')]
        [string]$TargetScreenName,
        [Parameter(ParameterSetName='Show')]
        [string]$TargetUserId,

        [Parameter(ParameterSetName='Incoming')]
        [switch]$Incoming,

        [Parameter(ParameterSetName='Pending')]
        [switch]$Pending,

        [Parameter(ParameterSetName='NoRetweets')]
        [switch]$NoRetweets

    )

    switch ($PSCmdlet.ParameterSetName) {
        'Lookup' {
            if ($null -eq $ScreenName -and $null -eq $UserId) {
                'You must provide one or more ScreenNames or one or more UserIds.' | Write-Warning
                return
            }

            if ($ScreenName.Count -gt 100) {
                'You must a maximum of 100 ScreenNames.' | Write-Warning
                return
            }
            if ($UserId.Count -gt 100) {
                'You must a maximum of 100 UserIds.' | Write-Warning
                return
            }

            $Query = [hashtable]::new()
            if ($ScreenName) {
                $Query.Add('screen_name',($ScreenName -join ','))
            }
            if ($UserId) {
                $Query.Add('user_id',($UserId -join ','))
            }

            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/lookup.json',
                $Query
            )
            Invoke-TwitterRequest -OAuthParameters $OAuthParameters
        }
        'Show' { # error??
            if ($null -eq $SourceScreenName -and $null -eq $SourceUserId) {
                'You must provide a SourceScreenName or a SourceUserId' | Write-Warning
                return
            }
            if ($SourceScreenName -and $SourceUserId) {
                'You must provide a SourceScreenName or a SourceUserId, but not both.' | Write-Warning
                return
            }
            if ($null -eq $TargetScreenName -and $null -eq $TargetUserId) {
                'You must provide a TargetScreenName or a SourceUserId' | Write-Warning
                return
            }
            if ($TargetScreenName -and $TargetUserId) {
                'You must provide a TargetScreenName or a TargetUserId, but not both.' | Write-Warning
                return
            }

            $Query = [hashtable]::new()
            if ($SourceScreenName) {
                $Query.Add('source_screen_name',$SourceScreenName)
            }
            if ($SourceUserId) {
                $Query.Add('source_id',$SourceUserId)
            }
            if ($TargeteScreenName) {
                $Query.Add('target_screen_name',$TargeteScreenName)
            }
            if ($TargetUserId) {
                $Query.Add('target_id',$TargetUserId)
            }

            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/show.json',
                $Query
            )
            @(Invoke-TwitterRequest -OAuthParameters $OAuthParameters).relationship
        }
        'Incoming' {
            $Query = [hashtable]::new()
            $Query.Add('cursor',-1)

            $OAuthParameters = [OAuthParameters]::new(
                'GET',
                'https://api.twitter.com/1.1/friendships/incoming.json',
                $Query
            )
            @(Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters).ids
        }
        'Pending' {
            $Query = [hashtable]::new()
            $Query.Add('cursor',-1)

            $OAuthParameters = [OAuthParameters]::new(
                'Get',
                'https://api.twitter.com/1.1/friendships/outgoing.json',
                $Query
            )
            @(Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters).ids
        }
        'NoRetweets' {
            $OAuthParameters = [OAuthParameters]::new(
                'Get',
                'https://api.twitter.com/1.1/friendships/no_retweets/ids.json',
                $null
            )
            @(Invoke-TwitterRequest -OAuthParameters $OAuthParameters).ids
        }
    }
}