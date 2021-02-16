function Get-TwitterListByOwner {
    [CmdletBinding(DefaultParameterSetName='ScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [ValidateNotNullOrEmpty()]
        [long]$UserId,
        [ValidateRange(1,1000)]
        [Alias('Count')]
        [int]$ResultsPerPage=20
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/lists/ownerships.json',
        $Query
    )
    Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue lists
}
