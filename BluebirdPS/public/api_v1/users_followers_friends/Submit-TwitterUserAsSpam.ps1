function Submit-TwitterUserAsSpam {
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ValueFromPipeline)]
        [BluebirdPS.APIV2.UserInfo.User]$User,
        [switch]$Block
    )

    $Action = 'Report as Spam'
    if($Block.IsPresent) {
        $Action += ' and Block'
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'POST'
        Endpoint = 'https://api.twitter.com/1.1/users/report_spam.json'
        Query = @{
            screen_name = $User.UserName
            perform_block = $Block
        }
    }
    $Target = '{0}, CreatedAt: {1}, Description: {2}' -f $User.UserName,$User.CreatedAt,$User.Description

    if ($PSCmdlet.ShouldProcess($Target, $Action)) {
        Invoke-TwitterRequest -RequestParameters $Request | Out-Null
    }
}
