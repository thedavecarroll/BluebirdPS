function Get-BluebirdPSAssemblyDetails {
    [OutputType('System.Reflection.TypeInfo')]
    param()
    ([System.AppDomain]::CurrentDomain.GetAssemblies() |
        Where-Object {$_.Location -match 'bluebirdps'}).GetTypes() |
        Where-Object {$_.Namespace -and $_.Fullname -notmatch '\+'} |
        Sort-Object -Property Namespace,Fullname
}