### Export-Clixml

Encrypt plain text credentials with Export-Clixml in scripts. It is important to notice that you should run the Export-Clixml command on the server with the user that will run your script. Export-Clixml uses the combination of both the servername and the users password to encrypt the XML-based file. This way you can only decrypt the file on the server itself with that specific user.

#### Example

1. You want to encrypt the credentials of a local account **CLIENT01\Admin** which you use to create a drive mapping with
2. Your server that hosts the script is **SERVER01**
3. The user that runs the script is **SVC_USER01**

**Run PowerShell as user SVC_USER01 on SERVER01**

```powershell
# In the pop-up window you want to provide the credentials of CLIENT01\Admin
Get-Credential | Export-Clixml -Path <encrypted_credentials>.<xml/cred/sec> # Extension doesn't matter
```

**On SERVER01 with user SVC_USER01 you can store the credentials in a variable**

```powershell
$Cred = Import-Clixml -Path <encrypted_credentials>.<xml/cred/sec>
```

**Use the variable/credentials to make a drive mapping**

```powershell
New-PSDrive -Name <name> -Root <destination> -PSProvider "FileSystem" -Credential $Cred
```
