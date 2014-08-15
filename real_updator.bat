@ECHO OFF
REM Assume this file is in 'cylon-portable' directory

SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
SET PATH=%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

REM ===== Update project-cylon
pip install --upgrade project-cylon
REM =====


%CURRENT_DRIVE%
cd "%~dp0..\sanity"
rmdir /S /Q ".\itruemart-sanity"
REM iTrueMart
git clone https://chawiwan_nin@bitbucket.org/chawiwan_nin/itruemart-sanity.git
REM welove
REM git clone xxx