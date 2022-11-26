[CmdletBinding(DefaultParameterSetName = 'Task')]
param(
    # Build task(s) to execute
    [Parameter(ParameterSetName = 'task', position = 0)]
    [ValidateSet('default','Build','Analyze','Test','Init','UpdateMarkdownHelp')]
    [string[]]$Task = 'default',

    # Bootstrap dependencies
    [switch]$Bootstrap,

    # List available build tasks
    [Parameter(ParameterSetName = 'Help')]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Bootstrap dependencies
if ($Bootstrap.IsPresent) {
    Get-PackageProvider -Name Nuget -ForceBootstrap | Out-Null
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    if (-not (Get-Module -Name PSDepend -ListAvailable)) {
        Install-Module -Name PSDepend -Repository PSGallery
    }
    Import-Module -Name PSDepend -Verbose:$false
    Invoke-PSDepend -Path $([IO.Path]::Combine($PSScriptRoot,'build','requirements.psd1')) -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
$psakeBuild = [IO.Path]::Combine($PSScriptRoot,'psakeBuild.ps1')
$BuildFunctions = [IO.Path]::Combine($PSScriptRoot,'build','BuildFunctions.psm1')
if ($PSCmdlet.ParameterSetName -eq 'Help') {
    Get-PSakeScriptTasks -buildFile $psakeBuild  |
        Format-Table -Property Name, Description, Alias, DependsOn
} else {
    Set-BuildEnvironment -Force
    if (-Not (Get-Command -Name Get-MilestoneByReleaseVersion -ErrorAction SilentlyContinue)) {
        Import-Module $BuildFunctions
    }
    Invoke-psake -buildFile $psakeBuild -taskList $Task -nologo
    exit ( [int]( -not $psake.build_success ) )
}
