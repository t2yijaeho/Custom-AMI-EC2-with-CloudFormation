$PrivateIP = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
$XEPath = "C:\app\Administrator\product\18.0.0\dbhomeXE\network\admin\"

(Get-Content ($XEPath + "tnsnames.ora")) -Replace "172.31.53.26", $PrivateIP | Set-Content ($XEPath + "tnsnames.ora")
(Get-Content ($XEPath + "listener.ora")) -Replace "172.31.53.26", $PrivateIP | Set-Content ($XEPath + "listener.ora")

Restart-Service -Name OracleServiceXE
Restart-Service -Name OracleOraDB18Home1TNSListener
Restart-Service -Name OracleOraDB18Home1MTSRecoveryService
