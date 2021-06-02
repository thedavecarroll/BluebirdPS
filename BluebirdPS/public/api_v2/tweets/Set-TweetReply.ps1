function Set-TweetReply {
    [SuppressMessage('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName='Hide')]
    param(
        [Parameter(Mandatory)]
        [string]$Id,
        [Parameter(ParameterSetName='Hide')]
        [switch]$Hide,
        [Parameter(ParameterSetName='Show')]
        [switch]$Show
    )

    switch ($PSCmdlet.ParameterSetName) {
        'Hide' { $Body = '{"hidden": true}'  }
        'Show' { $Body = '{"hidden": false}' }
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'PUT'
        Endpoint = 'https://api.twitter.com/2/tweets/{0}/hidden' -f $Id
        Body = $Body
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
