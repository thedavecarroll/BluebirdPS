function Remove-TwitterSavedSearch {
    [CmdletBinding(DefaultParameterSetName='ById',SupportsShouldProcess,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory)]
        [Alias('Id')]
        [ValidateNotNullOrEmpty()]
        [long[]]$SearchId
    )

    begin {
        $SavedSearches = Get-TwitterSavedSearch
    }

    process {
        foreach ($Id in $SearchId) {
            $ThisSearch = $SavedSearches.Where({$_.id -eq $Id})
            $ThisSearchInfo = 'Search : {0}, Created: {1}' -f $ThisSearch.query,$ThisSearch.created_at
            if ($ThisSearch) {
                if ($PSCmdlet.ShouldProcess($ThisSearchInfo, 'Removing Saved Search')) {
                    $Url = 'https://api.twitter.com/1.1/saved_searches/destroy/{0}.json' -f $Id
                    $OAuthParameters = [OAuthParameters]::new('POST',$Url)
                    Invoke-TwitterRequest -OAuthParameters $OAuthParameters | Out-Null
                }
            } else {
                'No saved search found with SearchId of {0}' -f $Id | Write-Warning
            }
        }
    }

}
