@ECHO OFF
REM Assume this file is in 'update' directory

SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
SET PATH=%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%
%CURRENT_DRIVE%
REM D:\cylon_portable\sanity
cd "%~dp0..\sanity"
git clone https://chawiwan_nin@bitbucket.org/chawiwan_nin/itruemart-sanity.git
