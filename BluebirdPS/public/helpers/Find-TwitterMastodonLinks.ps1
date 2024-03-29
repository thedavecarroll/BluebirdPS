function Find-TwitterMastodonLinks {
    [OutputType('BluebirdPS.TwitterMastodonReference')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.TwitterObject[]]$TwitterObject,
        [ValidateNotNullOrEmpty()]
        [Alias('IgnoreUrl')]
        [string[]]$IgnoreDomain
    )
    begin {
        $MastodonUserAccountRegex = '(?<MastodonUser>@\S+)@(?<MastodonInstance>[\w-.]+)'
        $MastodonUserUrlRegex = '(?<MastodonInstance>[\w-.]+\w+(\/web)*)\/(?<MastodonUser>@[\w+]+)'
        $MastodonUsers = [System.Collections.Generic.List[TwitterMastodonReference]]::new()
        $TwitterUsers =  [System.Collections.Generic.List[User]]::new()
        $Tweets =  [System.Collections.Generic.List[Tweet]]::new()
        if ($PSBoundParameters.ContainsKey('IgnoreDomain')) {
            $IgnoreDomainRegex = $IgnoreDomain -join '|'
        } else {
            $IgnoreDomainRegex = $false
        }
    }
    process {
        foreach ($Object in $TwitterObject) {
            if ($Object.GetType() -match 'User') {
                $TwitterUsers.Add($Object)
            }
            if ($Object.GetType() -match 'Tweet') {
                $Tweets.Add($Object)
            }
        }
    }
    end {
        foreach ($User in $TwitterUsers) {
            if ($User.Name -match  $MastodonUserAccountRegex) {
                if ($IgnoreDomainRegex) {
                    if ($Matches['MastodonInstance'] -match $IgnoreDomainRegex) {
                        continue
                    }
                }
                $MastodonUser = [TwitterMastodonReference]::new($User,$Matches,'Name')
                if (-Not $MastodonUsers.Contains($MastodonUser) -and $MastodonUser.IsValidDomain) {
                    $MastodonUsers.Add($MastodonUser)
                }
            }
            if ($User.Description -match  $MastodonUserAccountRegex) {
                if ($IgnoreDomainRegex) {
                    if ($Matches['MastodonInstance'] -match $IgnoreDomainRegex) {
                        continue
                    }
                }
                $MastodonUser = [TwitterMastodonReference]::new($User,$Matches,'Description')
                if (-Not $MastodonUsers.Contains($MastodonUser) -and $MastodonUser.IsValidDomain) {
                    $MastodonUsers.Add($MastodonUser)
                }
            }
            foreach ($Url in ($User.Entities.Where{$_.GetType() -match 'Url'} )) {
                if ($Url.ToString() -match  $MastodonUserUrlRegex) {
                    if ($IgnoreDomainRegex) {
                        if ($Matches['MastodonInstance'] -match $IgnoreDomainRegex) {
                            continue
                        }
                    }
                    $MastodonUser = [TwitterMastodonReference]::new($User,$Matches,'UrlEntity')
                    if (-Not $MastodonUsers.Contains($MastodonUser) -and $MastodonUser.IsValidDomain) {
                        $MastodonUsers.Add($MastodonUser)
                    }
                }
            }
        }
        foreach ($Tweet in $Tweets) {
            $User = $TwitterUsers | Where-Object Id -eq $Tweet.AuthorId | Select-Object -First 1
            if ($Tweet.Text -match $MastodonUserAccountRegex) {
                if ($IgnoreDomainRegex) {
                    if ($Matches['MastodonInstance'] -match $IgnoreDomainRegex) {
                        continue
                    }
                }
                $MastodonUser = [TwitterMastodonReference]::new($User,$Matches,'TweetText')
                if (-Not $MastodonUsers.Contains($MastodonUser) -and $MastodonUser.IsValidDomain) {
                    $MastodonUsers.Add($MastodonUser)
                }
            }
            foreach ($Url in ($Tweet.Entities.Where{$_.GetType() -match 'Url'})) {
                if ($Url.ToString() -match  $MastodonUserUrlRegex) {
                    if ($IgnoreDomainRegex) {
                        if ($Matches['MastodonInstance'] -match $IgnoreDomainRegex) {
                            continue
                        }
                    }
                    $MastodonUser = [TwitterMastodonReference]::new($User,$Matches,'TweetUrlEntity')
                    if (-Not $MastodonUsers.Contains($MastodonUser) -and $MastodonUser.IsValidDomain) {
                        $MastodonUsers.Add($MastodonUser)
                    }
                }
            }
            $User = $null
        }
        $MastodonUsers | Sort-Object -Property TwitterUserName
    }
}
