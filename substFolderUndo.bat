@REM Script file name substFolderUndo.bat
@REM Author: Naresh Seegobin www.nareshseegobin.com
@REM ---
@REM Purpose: Allows user to right click on a windows folder and remove ALL mappings with this folder path. 
@REM Use the substFolder.bat batch file to create the mapping.
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

@REM https://ss64.com/nt/for_cmd.html
FOR /f "tokens=1,2 delims=^>" %%G IN ('subst ^|find "%~f1"') DO (
                                                                 echo Result is [%%G] [%%H]
                                                                 set _SubstMyDrive=%%G
                                                                 echo !_SubstMyDrive!
                                                                 set _SubstMyDrive=!_SubstMyDrive:~0,1!
                                                                 echo subst !_SubstMyDrive!: /D
                                                                 subst !_SubstMyDrive!: /D
                                                                 )
endlocal

subst

@echo Feel free to close the command window at this point!!!
@ping 127.0.0.1 -n 240 > NUL

@REM End of script


