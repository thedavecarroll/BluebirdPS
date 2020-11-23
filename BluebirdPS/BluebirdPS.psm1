using namespace System.Management.Automation
using namespace Collections.ObjectModel
using namespace System.Collections
using namespace Microsoft.PowerShell.Commands

# --------------------------------------------------------------------------------------------------

#region set base path variables
$ResourcesPath = Join-Path -Path $PSScriptRoot -ChildPath 'resources'
if ($IsWindows) {
    $DefaultSavePath = Join-Path -Path $env:USERPROFILE -ChildPath '.BluebirdPS'
} else {
    $DefaultSavePath = Join-Path -Path $env:HOME -ChildPath '.BluebirdPS'
}
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
#endregion

#region Configuration variables and setup
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ConfigurationSavePath = Join-Path -Path $DefaultSavePath -ChildPath 'TwitterConfiguration.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterConfiguration = $null

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterConfigurationRefreshDate = $null
#endregion

#region
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$LanguagesSavePath = Join-Path -Path $DefaultSavePath -ChildPath 'TwitterLanguages.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterLanguages = $null
#endregion

#region ErrorMapping variables and setup
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ErrorMappingPath = Join-Path -Path $ResourcesPath -ChildPath 'TwitterErrorCodeExceptions.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterErrorMapping = $null
#endregion

#region other variables
[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$ApiEndpointsPath = Join-Path -Path $ResourcesPath -ChildPath 'TwitterApiEndpoints.json'

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$RateLimitWarning = $false

[System.Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$TwitterHistoryList = [System.Collections.Generic.List[object]]::new()
#endregion
