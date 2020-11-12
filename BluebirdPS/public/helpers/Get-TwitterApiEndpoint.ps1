function Get-TwitterApiEndpoint {
    [CmdLetBinding(DefaultParameterSetName='Endpoint')]
    param(
        [Parameter(ParameterSetName='Endpoint')]
        [ValidateSet(
            'account','blocks','mutes','users','followers',
            'friends','friendships','lists','help'
        )]
        [string[]]$Endpoint,
        [Parameter(ParameterSetName='Command')]
        [string]$Command
    )


    $ParameterFormat = 'Name','PSParameter','Implemented','Required','Description','DefaultValue','MinValue','MaxValue','Example'

    $EndpointFormat = @{l='Endpoint';e={ '{0} {1}' -f $_.Method.ToUpper(), $_.Resource}},'Function', 'ApiVersion', 'Resource', 'Method', 'Uri', 'ApiReference', 'Description', 'Iteration', @{l='Parameters';e={foreach ($Param in $_.Parameters) {[PSCustomObject]$Param | Select-Object $ParameterFormat}}}

    $TwitterApiEndpoints = Get-Content -Path $ApiEndpointsPath -Raw | ConvertFrom-Json -Depth 10 -AsHashtable

    switch ($PSCmdlet.ParameterSetName) {
        'Endpoint' {
            if ($Endpoint) {
                foreach ($ThisEndpoint in $Endpoint) {
                    $TwitterApiEndpoints.$ThisEndpoint
                }
            } else {
                $TwitterApiEndpoints
            }
        }
        'Command' {
            $TwitterApiEndpoints.Values.Values.Where{$_.Function -eq $Command} | ForEach-Object {
                [PSCustomObject]$_ | Select-Object $EndpointFormat
            }
        }

    }


}