function Get-TwitterApiEndpoint {
    [CmdLetBinding()]
    param(
        [ValidateSet(
            'account','blocks','mutes','users','followers',
            'friends','friendships','lists','help'
        )]
        [string[]]$Endpoint
    )
    Get-Content -Path $TwitterApiEndpoints -Raw | ConvertFrom-Json
}
