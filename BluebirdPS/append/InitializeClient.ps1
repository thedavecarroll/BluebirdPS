
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

# register arugment completers
Register-ArgumentCompleter -CommandName Get-TwitterApiEndpoint -ParameterName CommandName -ScriptBlock {
    param($commandName,$parameterName,$stringMatch) Get-Command -Module BluebirdPS -ListImported | ForEach-Object Name | Where-Object { $_ -match $stringMatch }
}