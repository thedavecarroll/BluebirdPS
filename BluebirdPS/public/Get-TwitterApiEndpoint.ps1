function Get-TwitterApiEndpoint {
    [CmdLetBinding()]
    param(
        [ValidateSet(
            'account','blocks','mutes','users','followers',
            'friends','friendships','lists','help'
        )]
        [string[]]$Endpoint
    )

    $TwitterApiEndpoints = Import-TwitterResource -ApiEndpoints
    if ($PSBoundParameters.ContainsKey('Endpoint')) {
        foreach ($ThisEndpoint in $Endpoint) {
            $TwitterApiEndpoints.$ThisEndpoint
        }
    } else {
        $TwitterApiEndpoints
    }

}
