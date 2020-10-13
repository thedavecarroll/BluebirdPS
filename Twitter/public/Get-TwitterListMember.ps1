function Get-TwitterListMember {
    [CmdletBinding(DefaultParameterSetName='ListId')]
    param(
        [Parameter(Mandatory,ParameterSetName='ListId')]
        [string]$ListId,

        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwernId')]
        [ValidateNotNullOrEmpty()]
        [string]$Slug,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwnerScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$OwnerScreenName,
        [Parameter(Mandatory,ParameterSetName='ShowSlugOwernId')]
        [ValidateNotNullOrEmpty()]
        [long]$OwnerId,

        [ValidateRange(1,5000)]
        [int]$ResultsPerPage = 20,
        [switch]$SkipStatus,
        [switch]$ExcludeEntities
    )

    $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
    $OAuthParameters = [OAuthParameters]::new(
        'Get',
        'https://api.twitter.com/1.1/lists/members.json',
        $Query
    )
    Invoke-TwitterCursorRequest -OAuthParameters $OAuthParameters -ReturnValue users

}
