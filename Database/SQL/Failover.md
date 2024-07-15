### Specify the 2 SQL servers and you can do a controlled failover to the passive node

```powershell
$SQL01 = "<server1>"
$SQL02 = "<server2>"

$ActiveNode = ((Get-ClusterGroup "SQL Server (SQLSERVER)").OwnerNode).Name
$PassiveNode = If ($ActiveNode -eq $SQL01) { $SQL02 } Else { $SQL01 }

Get-ClusterNode $ActiveNode | Get-ClusterGroup | Move-ClusterGroup -Node $PassiveNode
Get-ClusterNode $ActiveNode | Get-ClusterSharedVolume | Move-ClusterSharedVolume -Node $PassiveNode
```