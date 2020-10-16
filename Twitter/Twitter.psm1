using namespace System.Management.Automation
using namespace Collections.ObjectModel
using namespace System.Collections
using namespace Microsoft.PowerShell.Commands

#region dot source public and private function definition files
$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
try {
    'Public','Private' | ForEach-Object {
        $ImportFile = Get-ChildItem -Path (Join-Path -Path $ScriptPath -ChildPath "$_.ps1")
        . $ImportFile.FullName
    }
}
catch {
    $PSCmdlet.ThrowTerminatingError($_)
}
#endregion

#region handle module removal
$OnRemoveScript = {
#
}
$ExecutionContext.SessionState.Module.OnRemove += $OnRemoveScript
Register-EngineEvent -SourceIdentifier ([System.Management.Automation.PsEngineEvent]::Exiting) -Action $OnRemoveScript
#endregion

#region process module specific variables and other items
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

$ResourcePath = Join-Path -Path $PSScriptRoot -ChildPath 'resources'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterApiEndpoints = Join-Path -Path $ResourcePath -ChildPath 'TwitterApiEndpoints.json'

$ErrorMappingPath = Join-Path -Path $ResourcePath -ChildPath 'TwitterErrorCodeExceptions.json'
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ErrorMapping = Get-Content -Path $ErrorMappingPath -Raw | ConvertFrom-Json

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$RateLimitWarning = $false

Import-TwitterAuthentication
#endregion

