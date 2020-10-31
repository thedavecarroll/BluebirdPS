function Set-Retweet {
    [CmdletBinding(DefaultParameterSetName='Retweet')]
    param(
        [Parameter(Mandatory)]
        [long]$Id,
        [Parameter(ParameterSetName='Retweet')]
        [switch]$Retweet,
        [Parameter(ParameterSetName='Unretweet')]
        [switch]$Unretweet
    )

    if ($PSCmdlet.ParameterSetName -eq 'Retweet') {
        $BaseUri = 'https://api.twitter.com/1.1/statuses/retweet/{0}.json' -f $Id
    } else {
        $BaseUri = 'https://api.twitter.com/1.1/statuses/unretweet/{0}.json' -f $Id
    }

    $OAuthParameters = [OAuthParameters]::new('POST',$BaseUri)
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
