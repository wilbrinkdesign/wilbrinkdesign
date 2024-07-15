Enable-PSRemoting -SkipNetworkProfileCheck -Force
New-NetFirewallRule -DisplayName 'Windows Remote Management (HTTP-In)' -Name 'Windows Remote Management (HTTP-In)' -Profile Any -LocalPort 5985 -Protocol TCP
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true
Set-Item WSMan:\localhost\Service\AllowUnencrypted $true -Force
Restart-Service WinRM