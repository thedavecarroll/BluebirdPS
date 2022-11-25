properties {
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Build.CompileDirectories = 'Prepend', 'Classes', 'Private', 'Public', 'Append'
    $PSBPreference.Build.CompileScriptHeader = [System.Environment]::NewLine
    $PSBPreference.Test.ScriptAnalysis.SettingsPath = [IO.Path]::Combine($env:BHProjectPath,'build','ScriptAnalyzerSettings.psd1')
}

task GenerateExternalHelp {
    $ExternalHelpPath = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,(Get-UICulture).Name)

    $NewExternalHelpParams = @{
        Path = Get-ChildItem -Path $PSBPreference.Docs.RootDir -Include '*-*.md' -Recurse
        OutputPath = $ExternalHelpPath
        Force = $true
    }
    New-ExternalHelp @NewExternalHelpParams | Out-Null

    $AboutHelpMarkdown = Get-ChildItem -Path $([IO.Path]::Combine($PSBPreference.Docs.RootDir,"about_*.md"))
    foreach ($Help in $AboutHelpMarkdown) {
        $NewAboutHelpParams = @{
            Path = $Help.FullName
            OutputPath = $ExternalHelpPath
            Force = $true
        }
        New-ExternalHelp @NewAboutHelpParams | Out-Null
    }

} -Description 'Generates MAML-based help from PlatyPS markdown files'

task AddFileListToManifest {
    $FileListParentFolder = '{0}{1}' -f $PSBPreference.Build.ModuleOutDir,[IO.Path]::DirectorySeparatorChar

    $UpdateManifestParams = @{
        Path = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,"$env:BHProjectName.psd1")
        FileList = Get-ChildItem -Path $PSBPreference.Build.ModuleOutDir -File -Recurse | ForEach-Object {
            $_.FullName.Replace($FileListParentFolder,'')
        }
    }
    do {
        try {
            Update-ModuleManifest @UpdateManifestParams
            $Retry = $false
        }
        catch {
            $Retry = $true
        }
    } while ($Retry)


} -Description 'Add files list to module manifest'

task DotNetBuild -Depends 'StageFiles' {
    $ManifestPath = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,"$env:BHProjectName.psd1")
    $FileListParentFolder = '{0}{1}' -f $PSBPreference.Build.ModuleOutDir,[IO.Path]::DirectorySeparatorChar
    $OutputLibFolder = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,'lib')
    $DotNetSrcFolder = [IO.Path]::Combine($env:BHProjectPath,'src')

    dotnet build $DotNetSrcFolder -o $OutputLibFolder --nologo
    if ($LASTEXITCODE -ne 0) {
        'DotNetBuild task failed' | Write-Error -ErrorAction Stop
    }

    $Libraries = Get-ChildItem -Path $OutputLibFolder -Filter '*.dll'
    $LibraryList = $Libraries| ForEach-Object {
        $_.FullName.Replace($FileListParentFolder,'')
    }
    do {
        try {
            Update-ModuleManifest -Path $ManifestPath -NestedModules ($LibraryList -join ',')
            $Retry = $false
        }
        catch {
            $Retry = $true
        }
    } while ($Retry)

} -Description 'Compile .Net Library'

task CopyLicense -Depends StageFiles {
    $LicenseFile = [IO.Path]::Combine($env:BHProjectPath,'LICENSE')
    Copy-Item -Path $LicenseFile -Destination $PSBPreference.Build.ModuleOutDir -Force
} -Description 'Copy LICENSE File'
<#
New Tasks

task GenerateMarkdownHelp
task TestHelp

task UpdateChangeLog
task UpdateReleaseNotes -Depends UpdateChangeLog

task CreateReleaseAsset
task PublishReleaseToGitHub -Depends CreateReleaseAsset

task PublishModuleToGallery

https://github.com/microsoft/PowerShellForGitHub

#>

task Build -FromModule PowerShellBuild -depends @('DotNetBuild','CopyLicense','GenerateExternalHelp','AddFileListToManifest')

task default -depends Build