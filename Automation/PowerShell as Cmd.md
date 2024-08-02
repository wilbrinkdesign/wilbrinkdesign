### Run PowerShell as a cmd

#### Example: In the Command Prompt / Task Schedular, run PowerShell and fire up a cmdlet

```powershell
powershell.exe -Command "&{ Get-ChildItem -Path C:\Windows\ -Exclude *.txt }"
```