:: Purpose: Allows you to take ownership of a file and re-set the permissions so as to prevent the operating system from changing the file.
::          Useful if you have a certain patched verion and don't want the operating system of the application to update the file.
::
:: Usage: Replace [PROC1].exe etc with respective application executable that needs to be terminated to as to make the permission changes.
::        Replace [APPPATH] with the absolute application executable/file path.
::        Repalce [FILENAME1] with the file that needs it's permission changed.
::
:: Caveats: There may be cases where the file can still be altered, such as inadvertently taking ownership via the Windows Explorer GUI,
::          and is recommended that the batch file be executed again.
::          
:: Disclaimer: Use at your own risk, no gurantee or warranty is expressed or implied.
::
:: Created by Naresh Seegobin (www.nareshseegobin.com)
:: Revision History: 20190131-0001 - First public version - nseegobin
::                   20190525-0001 - Updated some documentation - nseegobin
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
:: The file ownership is set to the guest user so as to prevent the admin or other authorised users with admin previlidges from
:: resetting the permissions under elevated access. Should the ownership change, the bacthfile must be executed again.
:: The guest account is the only one that's created in windows but nnot used. You can create your own user account instead.
"C:\Program Files (x86)\Windows Resource Kits\Tools\subinacl.exe" /noverbose /file "[APPPATH1]\[FILENAME1]" /setowner=guest

icacls "[APPPATH1]\[FILENAME1]"

:: Keep the terminal open until the timeout period. 
:: The ping command is also functioning as a timeout but it's there in the event the timeout fail to launch in the batch file.
timeout 120
ping -n 50 127.0.0.1 > NUL

