$Apps_WMI = Get-WmiObject -Class Win32_Product | Where-Object Name -ne $null
$Apps_Reg_x64 = Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object DisplayName -ne $null
$Apps_Reg_x86 = Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object DisplayName -ne $null

$Complete_List = @()

Foreach ($App_WMI in $Apps_WMI)
{
	$List = New-Object -TypeName PSObject
	$List | Add-Member -NotePropertyName Name -NotePropertyValue $App_WMI.Name
	$List | Add-Member -NotePropertyName Version -NotePropertyValue $App_WMI.Version

	$Complete_List += $List
}

Foreach ($App_Reg_x64 in $Apps_Reg_x64)
{
	$List = New-Object -TypeName PSObject
	$List | Add-Member -NotePropertyName Name -NotePropertyValue $App_Reg_x64.DisplayName
	$List | Add-Member -NotePropertyName Version -NotePropertyValue $App_Reg_x64.DisplayVersion

	$Complete_List += $List
}

Foreach ($App_Reg_x86 in $Apps_Reg_x86)
{
	$List = New-Object -TypeName PSObject
	$List | Add-Member -NotePropertyName Name -NotePropertyValue $App_Reg_x86.DisplayName
	$List | Add-Member -NotePropertyName Version -NotePropertyValue $App_Reg_x86.DisplayVersion

	$Complete_List += $List
}

$Complete_List | Sort-Object Name -Unique