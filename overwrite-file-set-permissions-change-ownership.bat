:: Purpose: Allows you to take ownership of a file and re-set the permissions so as to prevent the operating system from changing the file.
::          Useful if you have a certain patched verion and don't want the operating system of the application to update the file.
::
:: Caveats: There may be cases where the file can still be altered, such as inadvertently taking ownership via the Windows Explorer GUI,
::          and is recommended that the batch file be executed again.
::          
:: Disclaimer: Use at your own risk, no gurantee or warranty is expressed or implied.
::
:: Created by Naresh Seegobin (www.nareshseegobin.com)
:: Revision History: 20190131-0001 - First public version - nseegobin
::
:: Attribution given via links below.

taskkill /f /im [PROC1].exe
taskkill /f /im [PROC2].exe
taskkill /f /im [PROC3].exe
taskkill /f /im [PROC4].exe
taskkill /f /im [PROC5].exe


:: https://stackoverflow.com/questions/43623139/remove-all-permissions-to-a-file-except-the-owner-of-the-file

:: https://superuser.com/questions/116625/recursively-change-owner-windows-7
:: https://superuser.com/questions/813878/how-would-i-use-takeown-to-take-ownership-of-all-folders-on-one-drive
takeown /f "[APPPATH1]\[FILENAME1]" /A

icacls "[APPPATH1]\[FILENAME1]" /reset
icacls "[APPPATH1]\[FILENAME1]" /inheritance:e
icacls "[APPPATH1]\[FILENAME1]" /inheritance:d /grant:r Administrators:(F)

copy /y %~dp0[FILENAME2].dll "[APPPATH1]\[FILENAME1]"

icacls "[APPPATH1]\[FILENAME1]" /inheritance:d /grant:r Administrators:(F)

:: https://social.technet.microsoft.com/Forums/lync/en-US/494884e5-6552-4a18-b4bb-d752eefed1dc/how-to-reset-security-permissions-for-program-files-folder?forum=w7itprosecurity
:: https://github.com/PowerShell/Win32-OpenSSH/issues/750
icacls "[APPPATH1]\[FILENAME1]" /inheritance:d /grant:r SYSTEM:(RX) /grant:r Administrators:(RX) /grant:r Users:(RX) /grant:r "ALL APPLICATION PACKAGES":(RX)

:: https://community.spiceworks.com/topic/297404-changing-security-and-ownership-via-batch-file
:: https://www.microsoft.com/en-us/download/details.aspx?id=23510
:::: icacls "[APPPATH1]\[FILENAME1]" /setowner guest
"C:\Program Files (x86)\Windows Resource Kits\Tools\subinacl.exe" /noverbose /file "[APPPATH1]\[FILENAME1]" /setowner=guest

icacls "[APPPATH1]\[FILENAME1]"

timeout 120
ping -n 50 127.0.0.1 > NUL

