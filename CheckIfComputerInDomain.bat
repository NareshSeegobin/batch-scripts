@echo -- Check registry for domain membership of the computer--

@REM Created by Naresh Seegobin
@REM Check links to sites and forums referenced.
@REM Purpose: Can be used for any purpose.
@REM Using the %USERDOMAIN%, %USERDNSDOMAIN% and %USERDOMAIN_ROAMINGPROFILE% environment variable 
@REM will not work for local accounts. It shows the local computer name and not a good way
@REM to identify the network the computer is joined to.

@REM Revision history - 20190805 - First published version


@REM MAIN SCRIPT HERE!!!!!

@REM Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
@REM https://superuser.com/questions/819253/how-to-tell-whether-machine-is-on-ad-domain-when-running-as-system
@REM https://www.tutorialspoint.com/batch_script/batch_script_reading_registry

@REM https://stackoverflow.com/questions/445167/how-can-i-get-the-value-of-a-registry-key-from-within-a-batch-script/46856737

@REM This works great except that I found I needed to change the "skip=4" to "skip=2". Windows 7 x64 

REG QUERY HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v Domain

@echo OFF

setlocal ENABLEEXTENSIONS
set KEY_NAME="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
set VALUE_NAME=Domain


FOR /F "usebackq skip=2 tokens=1-3" %%A IN (`REG QUERY %KEY_NAME% /v %VALUE_NAME% 2^>nul`) DO (
    set ValueName=%%A
    set ValueType=%%B
    set ValueValue=%%C
)


if defined ValueName (
    @echo Value Name = %ValueName%
    @echo Value Type = %ValueType%
    @echo Value Value = %ValueValue%

) else (
    @echo %KEY_NAME%\%VALUE_NAME% not found.
)


	if "%ValueValue%" == "domain1.com" (
	   @call .\AFile1.bat
	)

	if "%ValueValue%" == "domain2.com" (
		@copy /y "%~dp0AFile.vbs" "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\StartUp\AFile.vbs"
		@copy /y "%~dp0AFile.vbs" "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\AFile.vbs"
	)

		
