function Get-TwitterRateLimitWarning {
    if ($RateLimitWarning) {
        'RateLimitWarning is set to Enabled'
    } else {
        'RateLimitWarning is set to Disabled'
    }
}
