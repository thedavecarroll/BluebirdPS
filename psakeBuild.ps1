properties {
    $PSBPreference.Build.OutDir = [IO.Path]::Combine($env:BHProjectPath,'BuildOutput')
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Build.CompileDirectories = 'Prepend', 'Classes', 'Private', 'Public', 'Append'
    $PSBPreference.Build.CopyDirectories = 'resources'
    $PSBPreference.Build.CompileScriptHeader = [System.Environment]::NewLine
    $PSBPreference.Build.CopyDirectories =  [IO.Path]::Combine($env:BHPSModulePath,'resources')
    $PSBPreference.Test.ScriptAnalysis.SettingsPath = [IO.Path]::Combine($env:BHProjectPath,'build','ScriptAnalyzerSettings.psd1')
}

task CompileApiEndpoint -Depends 'StageFiles' {
    Import-Module $([IO.Path]::Combine($env:BHProjectPath,'build','BuildFunctions.psm1'))

    Import-TwitterApiEndpoints -Path $([IO.Path]::Combine($env:BHProjectPath,'Endpoints')) |
        ConvertTo-Json -Depth 20 |
        Add-Content -Path $([IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,'resources','TwitterApiEndpoints.json'))

} -Description 'Compile the Twitter API Endpoint JSON resource'

task GenerateExternalHelp {
    $ExternalHelpPath = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,(Get-UICulture).Name)

    $NewExternalHelpParams = @{
        Path = Get-ChildItem -Path $PSBPreference.Docs.RootDir -Include '*-*.md' -Recurse
        OutputPath = $ExternalHelpPath
        Force = $true
    }
    New-ExternalHelp @NewExternalHelpParams | Out-Null

    $NewAboutHelpParams = @{
        Path = $([IO.Path]::Combine($PSBPreference.Docs.RootDir,"about_$env:BHProjectName.md"))
        OutputPath = $ExternalHelpPath
        Force = $true
    }
    New-ExternalHelp @NewAboutHelpParams | Out-Null

} -Description 'Generates MAML-based help from PlatyPS markdown files'

task AddFileListToManifest {
    $FileListParentFolder = '{0}{1}' -f $PSBPreference.Build.ModuleOutDir,[IO.Path]::DirectorySeparatorChar

    $UpdateManifestParams = @{
        Path = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,"$env:BHProjectName.psd1")
        PropertyName = 'FileList'
        Value = Get-ChildItem -Path $PSBPreference.Build.ModuleOutDir -File -Recurse | ForEach-Object {
            $_.FullName.Replace($FileListParentFolder,'')
        }
    }
    Update-Manifest @UpdateManifestParams

} -Description 'Add files list to module manifest'

task Build -FromModule PowerShellBuild -depends @('CompileApiEndpoint','GenerateExternalHelp','AddFileListToManifest')

task default -depends Build