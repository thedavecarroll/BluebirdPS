function Get-TwitterOpenApi {
    [CmdletBinding(DefaultParameterSetName='Full')]
    param(
        [Parameter(ParameterSetName='Full')]
        [switch]$Full,
        [Parameter(ParameterSetName='Info')]
        [switch]$Info,
        [Parameter(ParameterSetName='Paths')]
        [Alias('Endpoint')]
        [switch]$Paths,
        [Parameter(ParameterSetName='Schema')]
        [switch]$Schema,
        [Parameter(ParameterSetName='Parameters')]
        [switch]$Parameters
    )

    if ($null -eq $script:TwitterOpenApi) {
        $script:TwitterOpenApi = Invoke-RestMethod -Uri 'https://api.twitter.com/2/openapi.json'
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Full'          { $script:TwitterOpenApi }
        'Info'          { $script:TwitterOpenApi.info }
        'Paths'         { $script:TwitterOpenApi.paths }
        'Schema'        { $script:TwitterOpenApi.components.schemas }
        'Parameters'    { $script:TwitterOpenApi.components.parameters }
    }
}
