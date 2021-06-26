function Set-BluebirdPSAuthUser {
    [CmdletBinding()]
    param()

    $Request = Invoke-TwitterVerifyCredentials
    if ($Request.Id) {
        $BluebirdPSConfiguration.AuthUserId = $Request.Id
        $BluebirdPSConfiguration.AuthUserName = switch ($BluebirdPSConfiguration.OutputType) {
            'CustomClasses' { $Request.UserName }
            'PSCustomObject' { $Request.screen_name }
            'JSON' { ($Request | ConvertFrom-Json -Depth 10).screen_name }
        }
        'Set AuthUserId ({0}), AuthUserName ({1})' -f $BluebirdPSConfiguration.AuthUserId,$BluebirdPSConfiguration.AuthUserName | Write-Verbose

        Export-BluebirdPSConfiguration

    } else {
        'Unable to set AuthUserId and AuthUserName' | Write-Warning
    }
}
