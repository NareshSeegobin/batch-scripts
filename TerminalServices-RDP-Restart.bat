@REM Filename: TerminalServices-RDP-Restart.bat
@REM Purpose: Restart remote desktop services on Windows.
@REM Author: Naresh Seegobin (www.nareshseegobin.com)

@REM Revision history:
@REM 20200130-01 - NS - Initial version

@REM https://theregime.wordpress.com/2013/05/16/how-to-restart-rdp-without-rebooting-windows/
@REM tasklist /s \\servername /svc /fi “imagename eq svchost.exe” (locate PID for TermService)
@REM taskkill /s \\servername /pid xxxx (may need /f to force, UAC might give problems as well)
@REM sc \\servername start TermService

@REM https://stackoverflow.com/questions/17327512/printing-all-tokens-after-2nd-token-in-a-batch-script

@REM   tasklist  /svc /fi "imagename eq svchost.exe" | find "TermService"
@REM taskkill /f /pid 1300 
@REM sc start TermService

for /f "tokens=2 delims= " %%i in ('tasklist  /svc /fi "imagename eq svchost.exe" ^| find "TermService"') do set "RDPPID=%%i"
echo Terminal Services Process ID (PID): %RDPPID%
taskkill /f /pid %RDPPID%
sc start TermService


