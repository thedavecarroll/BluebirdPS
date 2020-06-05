function Get-TwitterRateLimitWarning {
    if ($RateLimitWarning) {
        'RateLimitWarning is set to Enable'
    } else {
        'RateLimitWarning is set to Disable'
    }
}