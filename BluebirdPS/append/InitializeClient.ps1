#region Configuration and Authentication
if (-Not (Test-Path -Path $DefaultSavePath)) {

    # on first module import, create default save path and export configuration
    # import authentication will instruct user to run Set-TwiterAuthentication
    New-Item -Path $DefaultSavePath -Force -ItemType Directory | Out-Null
    Export-BluebirdPSConfiguration
    Import-TwitterAuthentication

} else {

    # after first module import, import configuration and authentication
    Import-BluebirdPSConfiguration
    Import-TwitterAuthentication
}
#end region

#region Get-TwitterApiEndpoint setup

# register arugment completers
Register-ArgumentCompleter -CommandName Get-TwitterApiEndpoint -ParameterName CommandName -ScriptBlock {
    param($commandName,$parameterName,$stringMatch) Get-Command -Module BluebirdPS -ListImported | ForEach-Object Name | Where-Object { $_ -match $stringMatch }
}

# store EndpointInfo in module variable
$BluebirdPSCommands = Get-Command -Module BluebirdPS -ListImported

[SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$script:TwitterEndpoints = foreach ($Command in $BluebirdPSCommands) {
    $NavigationLinks = (Get-Help -Name $Command.Name).relatedLinks.navigationLink.Where{$_.linkText -match '^(?!.*(Online|\w+-)).*$'}.Where{$_.linkText -match '- \w+\s(\/|\w+\/)'}
    if ($NavigationLinks.Count -gt 0) {
        $ApiEndpoint = $NavigationLinks.LinkText | ForEach-Object { $_.Split('-')[1].Trim() }
        $ApiDocumentation = $NavigationLinks.Uri
    } else {
        continue
    }
    [EndpointInfo]::new(
        $Command.Name,
        $ApiEndpoint,
        $ApiDocumentation
    )
}
#endregion

#region BluebirdPS Version
[SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '')]
$BluebirdPSVersion = [System.Reflection.Assembly]::GetAssembly([BluebirdPS.TwitterObject]).GetName().Version.ToString(3)
#endregion

