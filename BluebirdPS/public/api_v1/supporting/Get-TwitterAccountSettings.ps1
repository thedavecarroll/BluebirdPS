function Get-TwitterAccountSettings {
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    param()

    $Request = [TwitterRequest]@{
        Endpoint = 'https://api.twitter.com/1.1/account/settings.json'
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
