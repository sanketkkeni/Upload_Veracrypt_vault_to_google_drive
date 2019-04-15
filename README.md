# Upload_Veracrypt_vault_to_google_drive

I have created a procedure to upload my KeePass password manager database online (Google drive) in an encrypted fashion so that it will reflect the KeePass database with the most recent changes. So if I loose my local copy, I will have a backup of my latest passwords online and it will be very secure.

I am using 3 layer protection to keep my passwords extra secure:
	1. Using KeePass
	2. Using Veracrypt to encrypt the KeePass database.
	3. Google drive.
	
These are the steps that goes on when I add/ remove an entry from KeePass:

1. Add/remove an entry in KeePass
2. A task in "Task Scheduler" goes off everyday at a specific time which executes the Powershell script: "Run Batch file".
3. The powershell script checks if the KeePass file is updated in the last 24 hours. If it has then it executes the batch file: "Update Vault Batch File"
4. The batch file updates the Veracrypt Vault with the latest files and uploads this Vault to Google Chrome.