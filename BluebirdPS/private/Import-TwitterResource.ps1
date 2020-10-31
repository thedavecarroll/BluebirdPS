function Import-TwitterResource {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='Configuration')]
        [switch]$Configuration,
        [Parameter(Mandatory,ParameterSetName='Languages')]
        [switch]$Languages,
        [Parameter(Mandatory,ParameterSetName='ErrorMapping')]
        [switch]$ErrorMapping
    )

    switch ($PSCmdlet.ParameterSetName) {
        'Configuration' {
            $ResourcePath = $ConfigurationSavePath
        }
        'Languages' {
            $ResourcePath = $LanguagesSavePath
        }
        'ErrorMapping' {
            $ResourcePath = $ErrorMappingPath
        }
    }

    'Importing {0} from {1}' -f $PSCmdlet.ParameterSetName,$ResourcePath | Write-Verbose
    try {
        if (Test-Path -Path $ResourcePath) {
            $Resource = Get-Content -Path $ResourcePath -Raw | ConvertFrom-Json
        } else {
            if ($PSCmdlet.ParameterSetName -ne 'ErrorMapping') {
                $ErrorMessage = '{0}Unable to find {1} resource data.{0}Please export the resource using "Export-TwitterResource -{1}"' -f [System.Environment]::NewLine,$PSCmdlet.ParameterSetName
                $ErrorMessage | Write-Warning
                return
            }
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    switch ($PSCmdlet.ParameterSetName) {
        'Configuration' {
            [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
            $TwitterConfiguration = $Resource
        }
        'Languages' {
            [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
            $TwitterLanguages = $Resource
        }
        'ErrorMapping' {
            [System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
            $TwitterErrorMapping = $Resource
        }
    }

}
