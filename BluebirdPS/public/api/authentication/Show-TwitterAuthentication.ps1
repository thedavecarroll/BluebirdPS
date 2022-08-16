function Show-TwitterAuthentication {
    [OutputType('BluebirdPS.TwitterAuthentication')]
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
    param()
    if ($PSCmdlet.ShouldProcess("Twitter Authentication", "Show")) {
        [TwitterAuthentication]::new($OAuth)
    }
}