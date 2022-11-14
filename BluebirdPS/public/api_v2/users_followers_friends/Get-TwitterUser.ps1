function Get-TwitterUser {
    [OutputType(
        'BluebirdPS.APIV2.UserInfo.User',
        'BluebirdPS.APIV2.TweetInfo.Tweet'
    )]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [ValidateCount(1, 100)]
        [string[]]$User,
        [switch]$IncludeExpansions
    )

    begin {
        $UserNames = [List[string]]::new()
        $UserIds = [List[string]]::new()
    }

    process {
        foreach ($ThisUser in $User) {
            try {
                [long]::Parse($ThisUser) | Out-Null
                $UserIds.Add($ThisUser)
            }
            catch {
                $UserNames.Add($ThisUser)
            }
        }
    }

    end {
        if  ($UserNames.Count -eq 0 -and $UserIds.Count -eq 0) {
            $Request = [TwitterRequest]@{
                ExpansionType     = 'User'
                IncludeExpansions = $IncludeExpansions
                Endpoint = 'https://api.twitter.com/2/users/me'
            }
            $Request.SetCommandName('Get-TwitterUser')
            Invoke-TwitterRequest -RequestParameters $Request
        }

        if ($UserNames.Count -gt 0) {
            $Request = [TwitterRequest]@{
                ExpansionType     = 'User'
                IncludeExpansions = $IncludeExpansions
            }
            if ($UserNames.Count -eq 1) {
                $Request.Endpoint = 'https://api.twitter.com/2/users/by/username/{0}' -f $UserNames[0]
            } else {
                $Request.Endpoint = 'https://api.twitter.com/2/users/by'
                $Request.Query = @{'usernames' = $UserNames -join ',' }
            }
            $Request.SetCommandName('Get-TwitterUser')
            Invoke-TwitterRequest -RequestParameters $Request
        }

        if ($UserIds.Count -gt 0) {
            $Request = [TwitterRequest]@{
                ExpansionType     = 'User'
                IncludeExpansions = $IncludeExpansions
            }
            if ($UserIds.Count -eq 1) {
                $Request.Endpoint = 'https://api.twitter.com/2/users/{0}' -f $UserIds[0]
            } else {
                $Request.Endpoint = 'https://api.twitter.com/2/users'
                $Request.Query = @{'ids' = $UserIds -join ',' }
            }
            $Request.SetCommandName('Get-TwitterUser')
            Invoke-TwitterRequest -RequestParameters $Request
        }
    }
}
