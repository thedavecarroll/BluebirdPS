function Set-BluebirdPSAuthUser {
    [CmdletBinding()]
    param()

    $Request = Invoke-TwitterVerifyCredentials
    if ($Request.Id) {
        $BluebirdPSConfiguration.AuthUserId = $Request.Id
        if ($BluebirdPSConfiguration.RawOutput) {
            $BluebirdPSConfiguration.AuthUserName = $Request.screen_name
        } else {
            $BluebirdPSConfiguration.AuthUserName = $Request.UserName
        }

        'Set AuthUserId ({0}), AuthUserName ({1})' -f $BluebirdPSConfiguration.AuthUserId,$BluebirdPSConfiguration.AuthUserName | Write-Verbose

        Export-BluebirdPSConfiguration

    } else {
        'Unable to set AuthUserId and AuthUserName' | Write-Warning
    }
}
