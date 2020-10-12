function Get-TwitterBlocks {
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
            'Get',
            'https://api.twitter.com/1.1/blocks/list.json',
            $Query
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue users

    } else {
        $OAuthParameters = [OAuthParameters]::new(
            'Get',
            'https://api.twitter.com/1.1/blocks/ids.json',
            @{ cursor = -1}
        )
        Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue ids
    }
}
