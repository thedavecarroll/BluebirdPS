function Get-TwitterListSubscription {
    [CmdletBinding(DefaultParameterSetName='ScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [ValidateNotNullOrEmpty()]
        [string]$UserId,

        [ValidateRange(1,1000)]
        [int]$ResultsPerPage = 20
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'Get',
        'https://api.twitter.com/1.1/lists/subscriptions.json',
        $Query
    )
    Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue lists

}
