function Get-TwitterList {
    [CmdletBinding(DefaultParameterSetName='ListScreenName')]
    param(
        [Parameter(Mandatory,ParameterSetName='ListScreenName')]
        [ValidateNotNullOrEmpty()]
        [string]$ScreenName,
        [Parameter(Mandatory,ParameterSetName='ListUserId')]
        [ValidateNotNullOrEmpty()]
        [string]$UserId,
        [Parameter(ParameterSetName='ListScreenName')]
        [Parameter(ParameterSetName='ListUserId')]
        [switch]$OwnedListFirst,

        [Parameter(Mandatory,ParameterSetName='ShowId')]
        [ValidateNotNullOrEmpty()]
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
        [long]$OwnerId
    )

    if ($PSCmdlet.ParameterSetName -match 'List') {

        $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
        $OAuthParameters = [OAuthParameters]::new(
            'Get',
            'https://api.twitter.com/1.1/lists/list.json',
            $Query
        )
        Invoke-TwitterRequest -OAuthParameters $OAuthParameters

    } else {

        $Query = New-TwitterQuery -ApiParameters $PSBoundParameters
        $OAuthParameters = [OAuthParameters]::new(
            'Get',
            'https://api.twitter.com/1.1/lists/show.json',
            $Query
        )
        Invoke-TwitterRequest -OAuthParameters $OAuthParameters

    }
}
