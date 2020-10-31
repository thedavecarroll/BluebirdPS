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

# --------------------------------------------------------------------------------------------------

#region set base path variables
$ResourcesPath = Join-Path -Path $PSScriptRoot -ChildPath 'resources'
$DefaultSavePath = Join-Path -Path $env:HOME -ChildPath '.TwitterPowerShell'
#endregion

#region Authentication variables and setup
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$OAuthTokenSavePath = Join-Path -Path $DefaultSavePath -ChildPath 'twittercred.sav'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$OAuth =  @{
    ApiKey = $null
    ApiSecret = $null
    AccessToken = $null
    AccessTokenSecret = $null
    BearerToken = $null
}

Import-TwitterAuthentication
#endregion

#region Configuration variables and setup
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ConfigurationSavePath = Join-Path -Path $DefaultSavePath -ChildPath 'TwitterConfiguration.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterConfiguration = $null

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterConfigurationRefreshDate = $null

Import-TwitterResource -Configuration
#endregion

#region
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$LanguagesSavePath = Join-Path -Path $DefaultSavePath -ChildPath 'TwitterLanguages.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterLanguages = $null

Import-TwitterResource -Languages
#endregion

#region ErrorMapping variables and setup
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ErrorMappingPath = Join-Path -Path $ResourcesPath -ChildPath 'TwitterErrorCodeExceptions.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterErrorMapping = $null

Import-TwitterResource -ErrorMapping
#endregion

#region other variables
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ApiEndpointsPath = Join-Path -Path $ResourcesPath -ChildPath 'Endpoints'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$RateLimitWarning = $false

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterHistoryList = [System.Collections.Generic.List[object]]::new()
#endregion
