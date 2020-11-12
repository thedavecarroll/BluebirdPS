function Get-TwitterListSubscriber {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ParameterSetName='ShowId')]
        [ValidateNotNullOrEmpty()]
        [string]$ListId,

        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerId')]
        [ValidateNotNullOrEmpty()]
        [string]$Slug,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$OwnerScreenName,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerId')]
        [ValidateNotNullOrEmpty()]
        [long]$OwnerId,

        [ValidateRange(1,5000)]
        [int]$ResultsPerPage = 20,
        [switch]$SkipStatus,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'GET',
        'https://api.twitter.com/1.1/lists/subscribers.json',
        $Query
    )
    Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue users

}
