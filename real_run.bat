@ECHO OFF

SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
SET PATH=%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

%CURRENT_DRIVE%
cd "%~dp0..\sanity"
cd itruemart-sanity

"%SCRIPT%cylon.exe" run all
