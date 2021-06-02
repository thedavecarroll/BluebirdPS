function Get-TwitterListSubscription {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$UserName
    )

    if ($PSBoundParameters.ContainsKey('UserName')) {
        $UserInfo = $UserName
    } else {
        $UserInfo = $BluebirdPSConfiguration.AuthUserName
    }

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/subscriptions.json'
        Query = @{
            count = 1000
            cursor = -1
            screen_name = $UserInfo
        }
    }

    'Getting list subscriptions for user: {0}' -f $UserInfo | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request
}
