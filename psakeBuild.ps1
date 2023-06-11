properties {
    $PSBPreference.Build.CompileModule = $true
    $PSBPreference.Build.CompileDirectories = 'Prepend', 'Classes', 'Private', 'Public', 'Append'
    $PSBPreference.Build.CompileScriptHeader = [System.Environment]::NewLine
    $PSBPreference.Test.ScriptAnalysis.SettingsPath = [IO.Path]::Combine($env:BHProjectPath,'build','ScriptAnalyzerSettings.psd1')
    $DotNetSrcFolder = [IO.Path]::Combine($env:BHProjectPath,'src')
    $CurrentModuleManifest = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
    $ModuleVersion = $CurrentModuleManifest.ModuleVersion
    $ReleaseNotes = $CurrentModuleManifest.PrivateData.PSData.ReleaseNotes
    $ChangeLogPath = [IO.Path]::Combine($env:BHProjectPath,'CHANGELOG.md')
}

#region Required for Build
task SetBuildVariables -Depends 'StageFiles' {
    $script:ManifestPath = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,"$env:BHProjectName.psd1")

} -Description 'Set build variables that will be used in mulitple tasks'

task UpdateAssemblyVersion -Depends 'SetBuildVariables' {
    $ProjectFile = [IO.Path]::Combine($DotNetSrcFolder ,'BluebirdPS.csproj')
    [xml]$UpdateProjectFile = Get-Content -Path $ProjectFile
    $CurrentVersion = $UpdateProjectFile.GetElementsByTagName('Version').Item(0).InnerText
    $Found = 'Current assembly version from csproj file is v{0}' -f $CurrentVersion
    if ($CurrentVersion -ne $ModuleVersion) {
        '{0}. Updating to v{1}.' -f $Found,$ModuleVersion
        $UpdateProjectFile.GetElementsByTagName('Version').Item(0).InnerText = $ModuleVersion
        $UpdateProjectFile.Save($ProjectFile)
    } else {
        '{0}. New version is the same. No change to csproj will be made.' -f $Found
    }
    ''
} -Description 'Update the assembly version in the csproj file'

task DotNetBuild -Depends 'UpdateAssemblyVersion' {
    $FileListParentFolder = '{0}{1}' -f $PSBPreference.Build.ModuleOutDir,[IO.Path]::DirectorySeparatorChar
    $OutputLibFolder = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,'lib')

    dotnet build $DotNetSrcFolder --property:OutputPath=$OutputLibFolder --nologo
    if ($LASTEXITCODE -ne 0) {
        'DotNetBuild task failed' | Write-Error -ErrorAction Stop
    }
    ''
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
            $ManifestPath
            $Retry = $true
        }
    } while ($Retry)
} -Description 'Compile .Net library'

task UpdateReleaseNotes {
    $GitHubParams = @{
        OwnerName = 'thedavecarroll'
        RepositoryName = 'BluebirdPS'
        WarningAction = 'SilentlyContinue'
    }
    $MilestoneRelease = Get-MilestoneByReleaseVersion -ReleaseVersion $ModuleVersion @GitHubParams
    $script:ChangeLogUpdate = Get-ChangeLogUpdateForMilestone @GitHubParams -TargetRelease $ModuleVersion

    $script:UpdateMarkdownHelp = $false
    $script:Reason = ''
    if ($ReleaseNotes -eq $ChangeLogUpdate) {
        $script:Reason = 'ReleaseNotes are identical.'
    } else {
        if (-Not $ChangeLogUpdate) {
            $script:Reason = 'No GitHub milestone found for version v{0}.' -f $ModuleVersion
        } elseif ($MilestoneRelease.State -eq 'closed') {
            $script:Reason = 'The milestone for version {0} has already been closed.' -f $ModuleVersion
        } elseif ($null -eq $MilestoneRelease.Due) {
            $script:Reason = 'No due date set for milestone version v{0}.' -f $ModuleVersion
        } else {
            $UpdateReleaseNotes = $ChangeLogUpdate + [System.Environment]::NewLine + 'For full CHANGELOG, see https://docs.bluebirdps.dev/en/latest/CHANGELOG/'
            #Update-ModuleManifest -Path $env:BHPSModuleManifest -ReleaseNotes $UpdateReleaseNotes
            Update-ModuleManifest -Path $ManifestPath -ReleaseNotes $UpdateReleaseNotes
            $script:UpdateMarkdownHelp = $true
        }
    }
    if (-Not $UpdateMarkdownHelp) {
        '{0} ReleaseNotes will not be updated.' -f $Reason
    }
} -Description 'Update releases notes for module'

task UpdateMarkdownHelpVersion -Depends UpdateReleaseNotes {
    $script:CommandHelpMarkdown = Get-ChildItem -Path $PSBPreference.Docs.RootDir -Include '*-*.md' -Recurse
    if ($UpdateMarkdownHelp) {
        foreach ($CommandHelp in $CommandHelpMarkdown) {
            $UpdatedCommandHelp = [System.IO.File]::ReadAllLines($CommandHelp.FullName) -replace '\/v\d+.\d+.\d+\/',"/v$ModuleVersion/"
            [System.IO.File]::WriteAllLines($CommandHelp.FullName,$UpdatedCommandHelp)
        }
    } else {
        '{0} Markdown help will not be updated.' -f $Reason
        ''
    }
} -Description 'Update the module version in the markdown help files'

task GenerateExternalHelp -Depends UpdateMarkdownHelpVersion {
    $ExternalHelpPath = [IO.Path]::Combine($PSBPreference.Build.ModuleOutDir,(Get-UICulture).Name)
    $NewExternalHelpParams = @{
        Path = $CommandHelpMarkdown
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

task CopyLicense -Depends StageFiles {
    $LicenseFile = [IO.Path]::Combine($env:BHProjectPath,'LICENSE')
    Copy-Item -Path $LicenseFile -Destination $PSBPreference.Build.ModuleOutDir -Force
} -Description 'Copy LICENSE file'

task AddFileListToManifest -Depends UpdateReleaseNotes {
    $FileListParentFolder = '{0}{1}' -f $PSBPreference.Build.ModuleOutDir,[IO.Path]::DirectorySeparatorChar
    $UpdateManifestParams = @{
        Path = $ManifestPath
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

task CreateReleaseAsset -Depends Build {
    $DestinationZip = Join-Path -Path (Split-Path -Path $env:BHBuildOutput) -ChildPath ('BluebirdPS-v{0}.zip' -f $ModuleVersion)
    $CompressFolder = $env:BHBuildOutput + [System.IO.Path]::DirectorySeparatorChar + '*'
    Compress-Archive -Path $CompressFolder -DestinationPath $DestinationZip -Force
}

task UpdateChangeLog -Depends Build {
    Set-ChangeLog -ChangeLogPath $ChangeLogPath -ReleaseNotes $ChangeLogUpdate
    Copy-Item -Path $ChangeLogPath -Destination $PSBPreference.Docs.RootDir -Force
} -Description 'Update CHANGELOG'

<#
New Tasks

task UpdateMarkdownHelpVersion

task GenerateMarkdownHelp
task TestHelp

task PublishReleaseToGitHub -Depends CreateReleaseAsset

task PublishModuleToGallery

https://github.com/microsoft/PowerShellForGitHub




#>

task Build -FromModule PowerShellBuild -depends @(
    'DotNetBuild','GenerateExternalHelp','CopyLicense','AddFileListToManifest'
)

task PrepareToPublish -depends @(
    'Build','CreateReleaseAsset','UpdateChangeLog'
)

task default -depends Build