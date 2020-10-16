[CmdletBinding()]
param()

# set variables
$ProjectName = Split-Path -Path $PSScriptRoot -Leaf
$ModulePath = Join-Path -Path $PSScriptRoot -ChildPath $ProjectName
$ModulePsd1 = "$ProjectName.psd1"
$ModulePsm1 = "$ProjectName.psm1"
$ManifestPath = Join-Path -Path $PSScriptRoot -ChildPath $ProjectName -AdditionalChildPath $ModulePsd1
$RootModule = Join-Path -Path $PSScriptRoot -ChildPath $ProjectName -AdditionalChildPath $ModulePsm1
$ModuleManifest = Import-PowerShellDataFile -Path $ManifestPath
$VersionFolder = Join-Path -Path $PSScriptRoot -ChildPath 'BuildOutput' -AdditionalChildPath $ModuleManifest.ModuleVersion
$BuildManifest = Join-Path -Path $VersionFolder -ChildPath $ModulePsd1
$BuildModule = Join-Path -Path $VersionFolder -ChildPath $ModulePsm1

# create output folder
'Initializing output version folder: {0}' -f $VersionFolder
if (Test-Path -Path $VersionFolder) {
    Get-ChildItem -Path $VersionFolder -Recurse | Remove-Item -Recurse -Force
} else {
    New-Item -Path $VersionFolder -ItemType Directory -Force | Out-Null
}

# copy root module
Copy-Item -Path $RootModule -Destination $BuildModule

# add class, private, public source files to output module
# get name of functions to export
$SourceFolderToRootModule = 'Classes','Private','Public'
foreach ($SourceFolder in $SourceFolderToRootModule ) {

    if ($SourceFolder -eq 'Classes') {
        $TargetFile = $BuildModule
    } else {
        $TargetFile = Join-Path -Path $VersionFolder -ChildPath "$SourceFolder.ps1"
    }

    'Adding ps1 files in folder {0} target root module {1}' -f $SourceFolder, $BuildModule
    $SourceFiles = Get-ChildItem -Path (Join-Path -Path $ModulePath -ChildPath $SourceFolder) -Include '*.ps1','*.psm1' -Recurse
    $SourceFiles | ForEach-Object {

        '#region source: {0}\{1}' -f $SourceFolder,$_.Name
        $_ | Get-Content -Raw
        '#endregion'
        ''
    } | Add-Content -Path $TargetFile -Encoding utf8

    if ($SourceFolder -eq 'Public') {
        $FunctionsToExport = $SourceFiles.BaseName
    }
}

# copy TypeData
$TypeDataSourceFolder = Join-Path -Path $ModulePath -ChildPath 'TypeData'
if (Test-Path -Path $TypeDataSourceFolder) {
    'Copying format and typedata to target folder'
    $TypeDataTargetFolder = Join-Path -Path $VersionFolder -ChildPath 'TypeData'

    $Formats = Get-ChildItem -Path $TypeDataSourceFolder -Filter '*.Format.ps1xml'
    $Formats | ForEach-Object { Copy-Item -Path $_ -Destination $TypeDataTargetFolder }
    $FormatsToProcess = $Formats | ForEach-Object { 'TypeData{0}{1}' -f [IO.Path]::DirectorySeparatorChar,$_.Name }

    $Types = Get-ChildItem -Path $TypeDataSourceFolder -Filter '*.Types.ps1xml'
    $Types | ForEach-Object { Copy-Item -Path $_ -Destination $TypeDataTargetFolder }
    $TypesToProcess = $Types | ForEach-Object { 'TypeData{0}{1}' -f [IO.Path]::DirectorySeparatorChar,$_.Name }
}

# copy the contents of other folders
$SupportingFolders = Get-ChildItem -Path $ModulePath -Directory | Where-Object { $_.Name -notin $SourceFolderToRootModule }
foreach ($SupportingFolder in $SupportingFolders) {
    $TargetFolder = Join-Path -Path $VersionFolder -ChildPath $SupportingFolder.Name
    'Copying contents of folder {0} to {1}' -f $SupportingFolder.Name, $TargetFolder
    Copy-Item -Path $SupportingFolder -Destination $TargetFolder -Recurse
}

# copy manifest
'Copying module manifest'
Copy-Item -Path $ManifestPath -Destination $VersionFolder

# get new file list
$FileListParentFolder = '{0}{1}' -f $VersionFolder,[IO.Path]::DirectorySeparatorChar
$FileList = Get-ChildItem -Path $VersionFolder -File -Recurse | ForEach-Object {
    $_.FullName.Replace($FileListParentFolder,'')
}

# create module manifest
$PrivateData = $ModuleManifest.PrivateData.PSData
$ModuleManifest.Remove('PrivateData')
if ($FileList)          { $ModuleManifest['FileList'] = $FileList }
if ($FunctionsToExport) { $ModuleManifest['FunctionsToExport'] = $FunctionsToExport }
if ($FormatsToProcess)  { $ModuleManifest['FormatsToProcess'] = $FormatsToProcess }
if ($TypesToProcess)    { $ModuleManifest['TypesToProcess'] = $TypesToProcess }

New-ModuleManifest -Path $BuildManifest @ModuleManifest
Update-ModuleManifest -Path $BuildManifest -PrivateData $PrivateData
