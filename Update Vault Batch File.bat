rem This is a comment.

rem A drive will be created when veracrypt mounts the vault.

rem If A drive is already mounted, dismount it.
if exist "A:\" (
"C:\Program Files\VeraCrypt\veracrypt" /q /d A
timeout /t 3
)

rem Automatically open the Vault using Veracrypt
"C:\Program Files\VeraCrypt\veracrypt" /v "C:\Users\Sanket Keni\Documents\KeePass\Vault" /l A /a /p  VAULT-PASSWORD /b /q

rem Copy any of the latest modified files to the A drive(vault)
:loop
if exist "A:" (
    rem copy from source to the new drive
    COPY /Y "C:\Users\Sanket Keni\Documents\KeePass\KeePass.kdbx" "A:\Password List.kdbx"
) else (
    timeout /t 5
    goto loop
)


rem Dismount the Vault
"C:\Program Files\VeraCrypt\veracrypt" /q /d A

rem Upload to google drive
rem Copy gdrive-windows-x64.exe to Windows32 folder, just google the steps how to use gdrive to upload files to google drive using cmd.
rem Go to google drive on the browser to find the fileID, path should be your local path
gdrive-windows-x64.exe update [options] <fileId> <path>

rem PAUSE
