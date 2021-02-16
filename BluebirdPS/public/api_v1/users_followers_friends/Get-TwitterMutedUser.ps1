function Get-TwitterMutedUser {
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(ParameterSetName='List')]
        [switch]$List,

        [Parameter(ParameterSetName='List')]
        [switch]$SkipStatus,

        [Parameter(ParameterSetName='List')]
        [switch]$ExcludeEntities
    )

    if ($PSCmdlet.ParameterSetName -eq 'List') {
        $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/mutes/users/list.json',
            $Query
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue users

    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'GET',
            'https://api.twitter.com/1.1/mutes/users/ids.json',
            @{ cursor = -1}
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue ids
    }
}
