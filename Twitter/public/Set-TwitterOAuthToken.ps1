function Set-TwitterOAuthToken {
    [CmdletBinding()]
    param (
        [string]
        $ApiKey,

        [string]
        $ApiSecret,

        [string]
        $AccessToken,

        [string]
        $AccessTokenSecret
    )
    
    $Global:OAuth = @{
        ApiKey            = $ApiKey
        ApiSecret         = $ApiSecret
        AccessToken       = $AccessToken
        AccessTokenSecret = $AccessTokenSecret
    }  
    
}