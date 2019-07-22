@REM Purpose: Rename videos files with year first then month then date to closely resemble ISO 8601 (https://www.iso.org/iso-8601-date-and-time-format.html)
@REM Dashes will not be included.
@REM NB: Even in cloud storage, files are sorted alphanumerically.

@REM  https://stackoverflow.com/questions/30745000/reorder-file-name-in-folder-with-batch-script
@REM  Original code

REM @echo off
REM setlocal EnableDelayedExpansion

REM for /F "delims=" %%f in ('dir /A-D /B *.*') do (
   REM for /F "tokens=1-4 delims=-" %%a in ("%%~Nf") do (
      REM set "last=%%d"
      REM set "new=!last:~0,1!!last:~2,1!!last:~4,1!!last:~1,1!!last:~3,1!!last:~5,1!"
      REM ECHO ren "%%f" "%%a-%%b-%%c-!new!%%~Xf"
   REM )
REM )

@REM  Updated by Naresh Seegobin on 20190421 
@REM  Updated to deal with date renaming.

@echo off
setlocal EnableDelayedExpansion

for /F "delims=" %%f in ('dir /A-D /B *.*') do (
   for /F "tokens=1-2 delims=_" %%a in ("%%~Nf") do (
      set "first=%%a"
      set "new=!first:~4,4!!first:~0,2!!first:~2,2!"
      ren "%%f" "!new!_%%b%%~Xf"
   )
)
