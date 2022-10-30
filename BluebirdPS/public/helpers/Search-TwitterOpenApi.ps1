function Search-TwitterOpenApi {
    [CmdletBinding(DefaultParameterSetName='Endpoint')]
    param(
        [Parameter(ParameterSetName='Endpoint')]
        [ValidateNotNullOrEmpty()]
        [Alias('Path')]
        [string]$Endpoint,
        [Parameter(ParameterSetName='Parameter')]
        [ValidateNotNullOrEmpty()]
        [string]$Parameter,
        [Parameter(ParameterSetName='Schema')]
        [ValidateNotNullOrEmpty()]
        [string]$Schema
    )

    switch ($PSCmdlet.ParameterSetName) {
        'Endpoint' {
            $script:TwitterOpenApi.paths.psobject.Properties |
                Where-Object { $_.Name -match $Endpoint } |
                Select-Object Name,Value
        }
        'Parameter' {}
        'Schema' {
            $script:TwitterOpenApi.components.schemas.psobject.Properties |
                Where-Object { $_.Name -match $Schema } |
                Select-Object Name,Value
        }
    }
}