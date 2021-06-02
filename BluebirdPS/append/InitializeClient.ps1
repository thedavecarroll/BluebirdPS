# import resources from disk

Import-BluebirdPSConfiguration

Import-TwitterAuthentication

# register arugment completer

Register-ArgumentCompleter -CommandName Get-TwitterApiEndpoint -ParameterName CommandName -ScriptBlock {
    param($commandName,$parameterName,$stringMatch) Get-Command -Module BluebirdPS -ListImported | ForEach-Object Name | Where-Object { $_ -match $stringMatch }
}