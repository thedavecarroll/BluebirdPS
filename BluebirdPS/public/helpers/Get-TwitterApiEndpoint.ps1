function Get-TwitterApiEndpoint {
    [CmdLetBinding(DefaultParameterSetName='Resource')]
    param(
        [Parameter(ParameterSetName='Resource')]
        [ValidateSet(
            'account','application','blocks','direct_messages','favorites','followers',
            'friends','friendships','help','lists','media','mutes','oauth2','saved_searches',
            'search','statuses','users'
        )]
        [string[]]$Resource,
        [Parameter(ParameterSetName='Command')]
        [string]$Command
    )

    $ParameterFormat = 'Name','PSParameter','Implemented','Required','Description','DefaultValue',
        'MinValue','MaxValue','Example'

    $EndpointFormat = @{l='Endpoint';e={ '{0} {1}' -f $_.Method.ToUpper(), $_.Resource}},'Function',
        'ApiVersion','Resource','Method','Uri','ApiReference','Description','Iteration',
        @{l='Parameters';e={
            foreach ($Param in $_.Parameters) {
                [PSCustomObject]$Param | Select-Object $ParameterFormat
            }
        }}

    $TwitterApiEndpoints = Get-Content -Path $ApiEndpointsPath -Raw | ConvertFrom-Json -Depth 20 -AsHashtable

    switch ($PSCmdlet.ParameterSetName) {
        'Resource' {
            if ($PSBoundParameters.ContainsKey('Resource')) {
                $Resource | ForEach-Object {
                    $TwitterApiEndpoints.$_.Values | Select-Object $EndpointFormat
                }
            } else {
                $TwitterApiEndpoints.values.values | Select-Object $EndpointFormat
            }
        }
        'Command' {
            $TwitterApiEndpoints.Values.Values.Where{$_.Function -eq $Command} | ForEach-Object {
                [PSCustomObject]$_ | Select-Object $EndpointFormat
            }
        }
    }

}
