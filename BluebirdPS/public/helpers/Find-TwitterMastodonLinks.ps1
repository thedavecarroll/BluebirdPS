function Find-TwitterMastodonLinks {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User[]]$User,
        [switch]$IncludePinnedTweet
    )
    begin {
        $MastodonUserAccountRegex = '(^|\s|\()(?<MastodonUser>@\w+)@(?<MastodonInstance>\w+.[\w+]+)'
        $MastodonUserUrlRegex = '(?<MastodonInstance>[\w+.]+(/web)*)/(?<MastodonUser>@[\w+]+)'
        $MastodonUsers = [System.Collections.Generic.List[TwitterMastodonReference]]::new()
    }
    process {
        foreach ($TwitterUser in $User) {
            if ($TwitterUser.Name -match $MastodonUserAccountRegex) {
                $MastodonUser = [TwitterMastodonReference]::new($TwitterUser,$Matches,'Name')
                if (-Not $MastodonUsers.Contains($MastodonUser)) {
                    $MastodonUsers.Add($MastodonUser)
                }
            }
            if ($TwitterUser.Description -match  $MastodonUserAccountRegex) {
                $MastodonUser = [TwitterMastodonReference]::new($TwitterUser,$Matches,'Description')
                if (-Not $MastodonUsers.Contains($MastodonUser)) {
                    $MastodonUsers.Add($MastodonUser)
                }
            }
            foreach ($UrlTag in ($TwitterUser.Entities.Where{$_.GetType() -match 'Url'} )) {
                if ($UrlTag.ToString() -match  $MastodonUserUrlRegex -and $UrlTag.ToString() -notmatch ('youtube.com')) {
                    $MastodonUser = [TwitterMastodonReference]::new($TwitterUser,$Matches,'UrlEntity')
                    if (-Not $MastodonUsers.Contains($MastodonUser)) {
                        $MastodonUsers.Add($MastodonUser)
                    }
                }
            }
            if ($IncludePinnedTweet.IsPresent) {
                $PinnedTweet = $null
                # Some users protect their tweets so the try/catch is required
                if ($null -eq $TwitterUser.PinnedTweetId) {
                    continue
                }
                try {
                    $PinnedTweet = Get-Tweet -Id $TwitterUser.PinnedTweetId
                }
                catch {}
                foreach ($Tweet in $PinnedTweet) {
                    if ($Tweet.Text -match $MastodonUserAccountRegex) {
                        $MastodonUser = [TwitterMastodonReference]::new($TwitterUser,$Matches,'PinnedTweetText')
                        if (-Not $MastodonUsers.Contains($MastodonUser)) {
                            $MastodonUsers.Add($MastodonUser)
                        }
                    }
                }
                foreach ($TweetUrl in ($PinnedTweet.Entities.Where{$_.GetType() -match 'Url'})) {
                    if ($TweetUrl.ToString() -match  $MastodonUserUrlRegex -and $TweetUrl.ToString() -notmatch ('youtube.com')) {
                        $MastodonUser = [TwitterMastodonReference]::new($TwitterUser,$Matches,'PinnedTweetUrlEntity')
                        if (-Not $MastodonUsers.Contains($MastodonUser)) {
                            $MastodonUsers.Add($MastodonUser)
                        }
                    }
                }
            }
        }
    }
    end {
        $MastodonUsers | Sort-Object -Property TwitterUserName
    }
}