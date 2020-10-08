function Set-TwitterOAuthToken {
    [CmdletBinding()]
    param (
        [SecureString]
        $ApiKey = (Read-host -Prompt "API Key:" -AsSecureString),

        [SecureString]
        $ApiSecret = (Read-host -Prompt "API Secret:" -AsSecureString),

        [SecureString]
        $AccessToken = (Read-host -Prompt "Access Token:" -AsSecureString),

        [SecureString]
        $AccessTokenSecret = (Read-host -Prompt "Access Token Secret:" -AsSecureString)
    )
    
    $Script:OAuth = @{
        ApiKey            = $ApiKey | ConvertFrom-SecureString -AsPlainText -Force
        ApiSecret         = $ApiSecret | ConvertFrom-SecureString -AsPlainText -Force
        AccessToken       = $AccessToken | ConvertFrom-SecureString -AsPlainText -Force
        AccessTokenSecret = $AccessTokenSecret | ConvertFrom-SecureString -AsPlainText -Force
    }

}