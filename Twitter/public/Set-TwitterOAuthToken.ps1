function Set-TwitterOAuthToken {
    [CmdletBinding()]
    param (
        [securestring]
        $ApiKey,

        [securestring]
        $ApiSecret,

        [securestring]
        $AccessToken,

        [securestring]
        $AccessTokenSecret
    )
    
    $Global:OAuth = @{
        ApiKey            = $ApiKey | ConvertFrom-SecureString -AsPlainText -Force
        ApiSecret         = $ApiSecret | ConvertFrom-SecureString -AsPlainText -Force
        AccessToken       = $AccessToken | ConvertFrom-SecureString -AsPlainText -Force
        AccessTokenSecret = $AccessTokenSecret | ConvertFrom-SecureString -AsPlainText -Force
    }  
    
}