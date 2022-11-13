@{
    'PSDependOptions' = @{
        Target = 'CurrentUser'
    }
    'psake' = @{
        Version = '4.9.0'
    }
    'BuildHelpers' = @{
        Version = '2.0.16'
    }
    'PowerShellBuild' = @{
        #RequiredVersion = '0.5.0-beta1'
        RequiredVersion = '0.6.1'
        AllowPrerelease = $true
    }
    'PSScriptAnalyzer' = @{
        #Version = '1.19.1'
        Version = '1.21.0'
    }
    'platyPS' = @{
        #Version = '0.14.1'
        Version = '0.14.2'
    }
    'PowerShellforGitHub' = @{
        #Version = '0.16.0'
        Version = '0.16.1'
    }
    'Pester' = @{
        #Version = '5.2.0'
        Version = '5.3.3'
    }
    'PowerShellGet' = @{
        #Version = '2.2.0'
        Version = '2.2.5'
    }
}