function Get-TwitterListByOwner {
    [CmdletBinding()]
    param(
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$UserName
    )

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/lists/ownerships.json'
        Query = @{
            screen_name = $PSBoundParameters.ContainsKey('UserName') ? $UserName : $BluebirdPSConfiguration.AuthUserName
            count = 1000
        }
    }

    'Getting lists owned by: {0}' -f $Request.Query.'screen_name' | Write-Verbose
    Invoke-TwitterRequest -RequestParameters $Request
}
