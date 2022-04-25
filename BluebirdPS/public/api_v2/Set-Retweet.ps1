function Set-Retweet {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName='Retweet')]
    param(
        [Parameter(Mandatory)]
        [string]$Id,
        [Parameter(ParameterSetName='Retweet')]
        [switch]$Retweet,
        [Parameter(ParameterSetName='Unretweet')]
        [switch]$Unretweet
    )

    if ($PSCmdlet.ParameterSetName -eq 'Retweet') {
        $HttpMethod = 'POST'
    } else {
        $HttpMethod = 'DELETE'
    }

    $Request = [TwitterRequest]@{
        HttpMethod = $HttpMethod
        Endpoint = 'https://api.twitter.com//2/users/{0}/retweets' -f $Id
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
