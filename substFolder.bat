@REM Script file name substFolder.bat
@REM Author: Naresh Seegobin www.nareshseegobin.com
@REM ---
@REM Purpose: Allows user to right click on a windows folder and maps this folder path to 
@REM a drive letter using the last availabe drive letter.
@REM Very good for deep paths where Apps like Excel or Word gives file linking issues.
@REM Very good for when uploading files to the cloud and the deep paths presents an issue.
@REM Use the substFolderUndo.bat to remove the corresponding mapping.
@REM ----
@REM Revision History: 
@REM 20210717-01 - first version, tested and works
@REM YYYYMMDD
@REM End of revision history


@REM <Registry settings comment="---- remove @REM for each line withing the Registry settings tags, copy and paste in a new .reg file and execute to merge in registry.">

@REM Windows Registry Editor Version 5.00

@REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\substFolder]
@REM @="Subst folder to drive letter"

@REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\substFolder\command]
@REM @="C:\\Utilities\\System\\substFolder\\substFolder.bat \"%L\""


@REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\substFolderUndo]
@REM @="Subst folder to drive letter - undo"

@REM [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\substFolderUndo\command]
@REM @="C:\\Utilities\\System\\substFolder\\substFolderUndo.bat \"%L\""


@REM </Registry settings>


echo %~f1

setlocal enabledelayedexpansion

set dir=%~f1

@REM @ping 127.0.0.1 -n 5 > nul

echo %CD%
echo "%CD%\%~nx1-PAR"

@REM https://serverfault.com/questions/62578/how-to-get-a-list-of-drive-letters-on-a-system-through-a-windows-shell-bat-cmd
@REM https://stackoverflow.com/questions/27773805/what-does-p-mean-in-set-p
@REM https://renenyffenegger.ch/notes/Windows/dirs/Windows/System32/cmd_exe/commands/goto/index#cmd-exe_let-user-choose-an-option


@REM The command below is not required as it actually switches the drive letters.
@REM I want to get the letters buy invoking a display/show/view command/app.
@REM for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do  @%%i: 2>nul && set/pLastDriveLetter=%%i <nul

echo subst v: "%~f1"
echo subst v: "%CD%"


setlocal enabledelayedexpansion
set "_DRIVE.LETTERS.FREE=Z Y X W V U T S R Q P O N M L K J I H G F E D C B A "
for /f "skip=1 tokens=1,2 delims=: " %%a in ('wmic logicaldisk get deviceid^,volumename') do (
   set "_DRIVE.LETTERS.USED=!_DRIVE.LETTERS.USED!%%a,%%b@"
   set "_DRIVE.LETTERS.FREE=!_DRIVE.LETTERS.FREE:%%a =!"
)
set _DRIVE.LETTERS.USED=%_DRIVE.LETTERS.USED:~0,-2%
set _DRIVE.LETTERS.USED=%_DRIVE.LETTERS.USED:,@=, @%
set _DRIVE.LETTERS

@REM https://stackoverflow.com/questions/36857098/extract-first-character-from-a-string/36874146
echo %_DRIVE.LETTERS.FREE:~0,1%
set SubstMyDrive=%_DRIVE.LETTERS.FREE:~0,1%

echo subst %SubstMyDrive%: "%~f1"
subst %SubstMyDrive%: "%~f1"

explorer %SubstMyDrive%:

@REM @ping 127.0.0.1 -n 5 > nul

endlocal

@echo Feel free to close the command window at this point!!!
@ping 127.0.0.1 -n 240 > nul

@REM End of Script

