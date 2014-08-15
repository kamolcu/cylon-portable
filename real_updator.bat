@ECHO OFF
REM Assume this file is in 'cylon-portable' directory

SET APP=%~dp0..\App
SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
SET PATH=%APP%;%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

python -m compileall
REM ===== Update project-cylon
"%SCRIPT%\pip.exe" uninstall behave -y
"%SCRIPT%\pip.exe" install --upgrade project-cylon
REM =====


%CURRENT_DRIVE%
cd "%~dp0..\sanity"
rmdir /S /Q ".\itruemart-sanity"
REM iTrueMart
git clone https://chawiwan_nin@bitbucket.org/chawiwan_nin/itruemart-sanity.git
REM welove
REM git clone xxx