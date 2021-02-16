function Add-TwitterFriend {
    [CmdletBinding(DefaultParameterSetName='ScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ScreenName')]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='UserId')]
        [string]$UserId,
        [ValidateSet('1.1','2')]
        [string]$ApiVersion = $script:BluebirdPS.ApiVersionDefault,
        [ValidateSet('OAuth1.0a','OAuth2.0')]
        [string]$Authentication = $script:BluebirdPS.AuthenticationDefault
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $RequestParameters = [RequestParameters]::new(
        (Get-PSCallStack)[0].Command,
        $Query,
        $ApiVersion,
        $Authentication
    )



    Invoke-TwitterRequest -RequestParameters $RequestParameters
}
