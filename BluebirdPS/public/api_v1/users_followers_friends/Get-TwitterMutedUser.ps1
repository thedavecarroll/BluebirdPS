function Get-TwitterMutedUser {
    [CmdletBinding()]
    param()

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/mutes/users/ids.json'
        Query = @{ cursor = -1 }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
