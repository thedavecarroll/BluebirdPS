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
        $Endpoint = 'https://api.twitter.com/1.1/statuses/retweet/{0}.json' -f $Id
    } else {
        $Endpoint = 'https://api.twitter.com/1.1/statuses/unretweet/{0}.json' -f $Id
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = $Endpoint
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
