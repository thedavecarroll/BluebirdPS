function Get-TwitterApiEndpoint {
    [CmdLetBinding()]
    param(
        [ValildateSet(
            'account','blocks','mutes','users','followers',
            'friends','friendships','lists','help'
        )]
        [string[]]$Endpoint
    )

    $TwitterApiEndpoints = Split-Path -Path $PSScriptRoot |
        Join-Path -ChildPath 'resources' -AdditionalChildPath 'TwitterApiEndpoints.json'
    Get-Content -Path $TwitterApiEndpoints -Raw | ConvertFrom-Json
}