### CSV file

```csv
<server1>
<server2>
```

### Script 4 remote PowerShell Windows Updates

```powershell
Import-Csv <csv_file> -Header Server | ForEach-Object {
	Invoke-Command -ComputerName $_.Server -ScriptBlock {     
		$Computername = $env:COMPUTERNAME
		$OS_Versie = [System.Environment]::OSVersion.Version.Build

		If ($OS_Versie -ge 14393)
		{
			Write-Host "$Computername (build: $OS_Versie) updating..." -ForegroundColor Green
			usoclient startinstall
		}
		Else
		{
			Write-Host "$Computername (build: $OS_Versie) updating..." -ForegroundColor Green
			& C:\Windows\System32\wuauclt.exe /UpdateNow
		}
	} -AsJob
}
```

### If commands are not responsive, try fix and try again

```powershell
Import-Csv <csv_file> -Header Server | ForEach-Object {
	Invoke-Command -ComputerName $_.Server -ScriptBlock {     
		$Computername = $env:COMPUTERNAME
		$OS_Versie = [System.Environment]::OSVersion.Version.Build

		$Auto_Update_Option = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU").AUOptions
		Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Force
		Restart-Service wuauserv

		If ($OS_Versie -ge 14393)
		{
			Write-Host "$Computername (build: $OS_Versie) updating..." -ForegroundColor Green
			usoclient startscan
			usoclient startinstall
		}
		Else
		{
			Write-Host "$Computername (build: $OS_Versie) updating..." -ForegroundColor Green
			& C:\Windows\System32\wuauclt.exe /UpdateNow
		}

		New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value $Auto_Update_Option -Force
	} -AsJob
}
```
