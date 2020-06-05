using module .\classes\OAuthParameters.Class.psm1
using namespace System.Management.Automation
using namespace Collections.ObjectModel
using namespace System.Collections

#Requires -Version 7.0

# load the twittererrorcodes and httpresponsecodes

#region info
<#
The following members are exported via the module's data file (.psd1)
    Functions
    TypeData
    FormatData
#>
#endregion info

#region discover module name
$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
$ModuleName = $ExecutionContext.SessionState.Module
Write-Verbose -Message "Loading module $ModuleName"
#endregion discover module name

#region load module variables
Write-Verbose -Message "Creating modules variables"
$ErrorMappingPath = Join-Path -Path $PSScriptRoot -ChildPath 'resources' -AdditionalChildPath 'TwitterErrorCodeExceptions.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ErrorMapping = Get-Content -Path $ErrorMappingPath -Raw | ConvertFrom-Json

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$RateLimitWarning = $false
#endregion load module variables

#region Handle Module Removal
$OnRemoveScript = {
#
}
$ExecutionContext.SessionState.Module.OnRemove += $OnRemoveScript
Register-EngineEvent -SourceIdentifier ([System.Management.Automation.PsEngineEvent]::Exiting) -Action $OnRemoveScript
#endregion Handle Module Removal

#region dot source public and private function definition files, export publich functions
try {
    foreach ($Scope in 'Public','Private') {
        Get-ChildItem (Join-Path -Path $ScriptPath -ChildPath $Scope) -Filter *.ps1 | ForEach-Object {
            . $_.FullName
            if ($Scope -eq 'Public') {
                Export-ModuleMember -Function $_.BaseName -ErrorAction Stop
            }
        }
    }
}
catch {
    Write-Error ("{0}: {1}" -f $_.BaseName,$_.Exception.Message)
    exit 1
}
#endregion dot source public and private function definition files, export publich functions


