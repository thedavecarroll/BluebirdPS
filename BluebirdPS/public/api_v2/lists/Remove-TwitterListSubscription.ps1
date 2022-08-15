function Remove-TwitterListSubscription {
    [CmdletBinding(DefaultParameterSetName='ById')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [Alias('ListId')]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList')]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $ListId = $Id
        $List = Get-TwitterList -Id $Id
    } else {
        $ListId = $List.Id
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'DELETE'
        Endpoint ='https://api.twitter.com/2/users/{0}/followed_lists/{1}' -f $BluebirdPSConfiguration.AuthUserId,$ListId
    }

    Invoke-TwitterRequest -RequestParameters $Request

}
