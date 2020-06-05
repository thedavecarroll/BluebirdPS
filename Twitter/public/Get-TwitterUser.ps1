function Get-TwitterUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [switch]$ExcludeEntities
    )

    $Query = [hashtable]::new()
    if ($PSBoundParameters.ContainsKey('ExcludeEntities')) {
        $Query.Add('include_entities','false')
    } else {
        $Query.Add('include_entities','true')
    }
    if ($PSCmdlet.ParameterSetName -eq 'ScreenName') {
        $Query.Add('screen_name',$ScreenName)
    } else {
        $Query.Add('user_id',$UserId)
    }

    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/users/show.json',
        $Query
    )

    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}