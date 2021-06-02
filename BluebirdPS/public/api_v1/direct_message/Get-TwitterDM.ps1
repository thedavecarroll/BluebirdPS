function Get-TwitterDM {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [ValidateRange(1,50)]
        [int]$MessageCount = 20
    )

    if ($PSBoundParameters.ContainsKey('Id')) {
        $Request = [TwitterRequest]@{
            Endpoint = 'https://api.twitter.com/1.1/direct_messages/events/show.json'
            Query = @{'id' = $Id }
        }
    } else {
        $Request = [TwitterRequest]@{
            Endpoint = 'https://api.twitter.com/1.1/direct_messages/events/list.json'
            Query = @{'count'= $MessageCount }
        }
    }

    Invoke-TwitterRequest -RequestParameters $Request
}
