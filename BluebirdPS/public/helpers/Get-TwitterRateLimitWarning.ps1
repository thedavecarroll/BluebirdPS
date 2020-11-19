function Get-TwitterRateLimitWarning {
    if ($script:RateLimitWarning) {
        'RateLimitWarning is set to Enabled'
    } else {
        'RateLimitWarning is set to Disabled'
    }
}
