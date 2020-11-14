function Unpublish-TwitterDM {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Alias('Id')]
        [string]$DirectMessageId
    )

    $OAuthParameters = [OAuthParameters]::new(
        'DELETE',
        'https://api.twitter.com/1.1/direct_messages/events/destroy.json',
        @{'id'= $DirectMessageId }
    )
    Invoke-TwitterRequest -OAuthParameters $OAuthParameters
}
