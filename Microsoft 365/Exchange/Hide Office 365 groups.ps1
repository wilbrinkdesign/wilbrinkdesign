Get-UnifiedGroup | Where-Object { $_.HiddenFromExchangeClientsEnabled -eq $False } | Set-UnifiedGroup -HiddenFromExchangeClientsEnabled:$true