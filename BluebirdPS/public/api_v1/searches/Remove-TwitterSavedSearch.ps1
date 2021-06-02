function Remove-TwitterSavedSearch {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory,ParameterSetName='ById',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [Parameter(Mandatory,ParameterSetName='BySavedSearch',ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [BluebirdPS.APIV1.SavedSearch]$SavedSearch
    )

    if ($PSCmdlet.ParameterSetName -eq 'ById') {
        $SavedSearch = Get-TwitterSavedSearch -Id $Id
    }

    $SearchInfo = 'Search: {0}, Created: {1}' -f $SavedSearch.Query,$SavedSearch.CreatedAt
    if ($SavedSearch) {
        if ($PSCmdlet.ShouldProcess($SearchInfo, 'Removing Saved Search')) {
            $Request = [TwitterRequest]@{
                HttpMethod = 'POST'
                Endpoint = 'https://api.twitter.com/1.1/saved_searches/destroy/{0}.json' -f $SavedSearch.Id
            }
            Invoke-TwitterRequest -RequestParameters $Request | Out-Null
        }
    } else {
        'No saved search found with SearchId of {0}' -f $ThisSearchId | Write-Warning
    }

}
