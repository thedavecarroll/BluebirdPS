function Get-TwitterUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/show.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
