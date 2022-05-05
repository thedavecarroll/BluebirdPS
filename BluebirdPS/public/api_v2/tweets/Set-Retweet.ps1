function Set-Retweet {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'Retweet')]
    param(
        [Parameter(Mandatory)]
        [string]$Id,
        [Parameter(ParameterSetName = 'Retweet')]
        [switch]$Retweet,
        [Parameter(ParameterSetName = 'Unretweet')]
        [switch]$Unretweet
    )

    if ($PSCmdlet.ParameterSetName -eq 'Retweet') {
        $Body = @{
            tweet_id = $Id
        }
        $Request = [TwitterRequest]@{
            HttpMethod = 'POST'
            Endpoint   = 'https://api.twitter.com/2/users/{0}/retweets' -f $BluebirdPSConfiguration.AuthUserId
            Body       = ($Body | ConvertTo-Json -Depth 10 -Compress)
        }
    }
    else {
        $Request = [TwitterRequest]@{
            HttpMethod = 'DELETE'
            Endpoint   = 'https://api.twitter.com/2/users/{0}/retweets/{1}' -f $BluebirdPSConfiguration.AuthUserId, $id
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
