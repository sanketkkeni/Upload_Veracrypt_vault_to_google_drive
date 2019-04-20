#Run the batch file when the file to be put in the vault is modified recently (past 24 hours)

$lastChanged = (Get-Item 'C:\Users\Sanket Keni\Documents\KeePass\KeePass.kdbx').LastWriteTime
$currentDate = Get-Date
$timeDiff = (NEW-TIMESPAN -Start $lastChanged -End $currentDate).Minutes + (NEW-TIMESPAN -Start $lastChanged -End $currentDate).Hours * 60 + (NEW-TIMESPAN -Start $lastChanged -End $currentDate).Days * 24 * 60 
# Write-Host "$timeDiff.Minutes.ToString()"
if ($timeDiff -lt 24*60){
	& 'C:\Users\Sanket Keni\Documents\KeePass\Update Vault Batch File.bat'
}
