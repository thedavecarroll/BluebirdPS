function Set-TwitterList {
    [OutputType('BluebirdPS.APIV2.ListInfo.List')]
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById')]
        [ValidatePattern('^[0-9]{1,19}$', ErrorMessage = "The List Id '{0}' is not valid.")]
        [string]$Id,

        [Parameter(Mandatory,ParameterSetName='ByList',ValueFromPipeline)]
        [ValidateObjectNotNullOrEmpty()]
        [BluebirdPS.APIV2.ListInfo.List]$List,

        [Parameter()]
        [ValidateLength(1,25)]
        [string]$Name,

        [ValidateLength(0,100)]
        [string]$Description,

        [boolean]$Private
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $ListId = $Id
        $List = Get-TwitterList -Id $Id
    } else {
        $ListId = $List.Id
    }

    $Body = @{}
    'Name','Description','Private' | ForEach-Object {
        if ($PSBoundParameters.ContainsKey($_)) {
            $Body.Add($_.ToLower(), $PSBoundParameters[$_])
        }
    }

    $Request = [TwitterRequest]@{
        HttpMethod = 'PUT'
        Endpoint = 'https://api.twitter.com/2/lists/{0}' -f $ListId
        Body = [PSCustomObject]$Body | ConvertTo-Json
    }

    try{
        if ($PSCmdlet.ShouldProcess($List.ToString(),'Update list')) {
            $SetTwitterList = Invoke-TwitterRequest -RequestParameters $Request
            if ($SetTwitterList) {
                Get-TwitterList -Id $SetTwitterList
            }
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

}
