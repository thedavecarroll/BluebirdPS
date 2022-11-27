using namespace System.Collections
using namespace System.Collections.Generic
using namespace Collections.ObjectModel
using namespace System.Management.Automation
using namespace System.Diagnostics.CodeAnalysis
using namespace Microsoft.PowerShell.Commands
using namespace BluebirdPS
using namespace BluebirdPS.APIV1
using namespace BluebirdPS.APIV2
using namespace BluebirdPS.APIV2.TweetInfo
using namespace BluebirdPS.APIV2.UserInfo
using namespace BluebirdPS.Exceptions
using namespace BluebirdPS.Validation

# --------------------------------------------------------------------------------------------------

#region set base path variables
if ($IsWindows) {
    $DefaultSavePath = Join-Path -Path $env:USERPROFILE -ChildPath '.BluebirdPS'
} else {
    $DefaultSavePath = Join-Path -Path $env:HOME -ChildPath '.BluebirdPS'
}
#endregion

#region Authentication variables and setup
[SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$OAuth =  @{
    ApiKey = $null
    ApiSecret = $null
    AccessToken = $null
    AccessTokenSecret = $null
    BearerToken = $null
}
#endregion

#region BluebirdPS configuration variable
[SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$BluebirdPSConfiguration = [Configuration]@{
    ConfigurationPath = Join-Path -Path $DefaultSavePath -ChildPath 'Configuration.json'
    CredentialsPath = Join-Path -Path $DefaultSavePath -ChildPath 'twittercred.sav'
}
#endregion

#region other variables
[SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$BluebirdPSHistoryList = [List[ResponseData]]::new()
$global:BluebirdPSLastResponse = [ResponseData]::new()
#endregion

#region Handle Module Removal
$OnRemoveScript = {
    Remove-Variable -Name BluebirdPSLastResponse -Scope Global -Force
}
$ExecutionContext.SessionState.Module.OnRemove += $OnRemoveScript
Register-EngineEvent -SourceIdentifier ([System.Management.Automation.PsEngineEvent]::Exiting) -Action $OnRemoveScript
#endregion Handle Module Removal