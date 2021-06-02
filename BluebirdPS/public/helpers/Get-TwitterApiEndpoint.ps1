function Get-TwitterApiEndpoint {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string[]]$CommandName,
        [ValidateNotNullOrEmpty()]
        [string]$Endpoint
    )

    if ($script:BluebirdPSCommands.Count -lt 1) {
        $script:AllBluebirdPSCommands = Get-Command -Module BluebirdPS -ListImported
        $script:PublicFunctions = (Get-Module -Name BluebirdPS).ExportedFunctions.Values.Name
    }

    if ($PSBoundParameters.ContainsKey('CommandName')) {
        $BluebirdPSCommands = foreach ($Command in $CommandName) {
            $AllBluebirdPSCommands | Where-Object { $_.Name -eq $Command }
        }
    } else {
        $BluebirdPSCommands = $AllBluebirdPSCommands
    }

    $TwitterEndpoints = foreach ($Command in $BluebirdPSCommands) {
        $NavigationLinks = (Get-Help -Name $Command.Name).relatedLinks.navigationLink.Where{$_.linkText -match '^(?!.*(Online|\w+-)).*$'}.Where{$_.linkText -match '- \w+\s(\/|\w+\/)'}
        if ($NavigationLinks.Count -gt 0) {
            $ApiEndpoint = $NavigationLinks.LinkText | ForEach-Object { $_.Split('-')[1].Trim() }
            $ApiDocumentation = $NavigationLinks.Uri
        } else {
            continue
        }
        [EndpointInfo]::new(
            $Command.Name,
            ($Command.Name -notin $PublicFunctions ? 'Private' : 'Public'),
            $ApiEndpoint,
            $ApiDocumentation
        )
    }

    if ($PSBoundParameters.ContainsKey('Endpoint')) {
        $TwitterEndpoints | Where-Object {$_.ApiEndpoint -match $Endpoint -and $_.CommandName -ne 'Get-TwitterApiEndpoint'} | Sort-Object -Property Visibility
    } else {
        $TwitterEndpoints | Where-Object {$_.ApiEndpoint.Count -gt 0 -and $_.CommandName -ne 'Get-TwitterApiEndpoint'} | Sort-Object -Property Visibility
    }

}
