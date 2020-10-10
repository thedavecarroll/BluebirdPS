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
#endregion

#region discover module name
$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
$ModuleName = $ExecutionContext.SessionState.Module
Write-Verbose -Message "Loading module $ModuleName"
#endregion

#region load module variables
Write-Verbose -Message 'Creating module variables'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$OAuthTokenPath = Join-Path -Path $env:HOME -ChildPath '.TwitterPowerShell' -AdditionalChildPath 'twittercred.sav'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$OAuth =  @{
    ApiKey = $null
    ApiSecret = $null
    AccessToken = $null
    AccessTokenSecret = $null
    BearerToken = $null
}

$ErrorMappingPath = Join-Path -Path $PSScriptRoot -ChildPath 'resources' -AdditionalChildPath 'TwitterErrorCodeExceptions.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ErrorMapping = Get-Content -Path $ErrorMappingPath -Raw | ConvertFrom-Json

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$RateLimitWarning = $false
#endregion

#region Handle Module Removal
$OnRemoveScript = {
#
}
$ExecutionContext.SessionState.Module.OnRemove += $OnRemoveScript
Register-EngineEvent -SourceIdentifier ([System.Management.Automation.PsEngineEvent]::Exiting) -Action $OnRemoveScript
#endregion

#region dot source public and private function definition files, export public functions
try {
    foreach ($Scope in 'Public','Private') {
        Get-ChildItem (Join-Path -Path $ScriptPath -ChildPath $Scope) -Filter *.ps1 | ForEach-Object {
            . $_.FullName
        }
    }
}
catch {
    Write-Error ("{0}: {1}" -f $_.BaseName,$_.Exception.Message)
    exit 1
}
#endregion

#region import Twitter credential file
Import-TwitterAuthentication
#endregion