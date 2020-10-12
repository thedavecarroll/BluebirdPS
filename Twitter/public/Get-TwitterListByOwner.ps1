function Get-TwitterListByOwner {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [string]$ScreenName,
        [ValidateNotNullOrEmpty()]
        [long]$UserId,
        [ValidateRange(1,1000)]
        [Alias('Count')]
        [int]$ResultsPerPage=20
    )

    $Required = 'You must supply either a ScreenName or UserId'
    $ValidationErrorRecord = @{
        Message = [String]::Empty
        Parameter = 'Required Parameters'
        ErrorId = 'ScreenNameOrUserId'
    }

    if (-Not ($PSBoundParameters.ContainsKey('ScreenName')) -and (-Not $PSBoundParameters.ContainsKey('UserId'))) {
        $ValidationErrorRecord.Message = '{0}.' -f $Required
    }
    if ($PSBoundParameters.ContainsKey('ScreenName') -and $PSBoundParameters.ContainsKey('UserId')) {
        $ValidationErrorRecord.Message = '{0}, but not both.' -f $Required
    }

    if ($ValidationErrorRecord.Message.Length -gt 0) {
        $PSCmdlet.ThrowTerminatingError((New-ValidationErrorRecord @ValidationErrorRecord))
    }

    $Query = [hashtable]::new()
    if ($ScreenName) {
        $Query.Add('screen_name',$ScreenName)
    }
    if ($UserId) {
        $Query.Add('user_id',$UserId)
    }
    $Query.Add('count',$ResultsPerPage)

    $OAuthParameters = [OAuthParameters]::new(
        'Get',
        'https://api.twitter.com/1.1/lists/ownerships.json',
        $Query
    )
    Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue lists
}
