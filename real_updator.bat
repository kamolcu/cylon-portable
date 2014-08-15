@ECHO OFF
REM Assume this file is in 'cylon-portable' directory

SET APP=%~dp0..\App
SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
REM SET PATH=%APP%;%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

"%APP%\python.exe" -m compileall
REM ===== Update project-cylon
"%APP%\python.exe" "%~dp0..\App\Lib\site-packages\easy_install.py" pip
REM "%SCRIPT%\pip.exe" uninstall six -y
"%APP%\python.exe" "%~dp0..\App\Lib\site-packages\easy_install.py" six
"%SCRIPT%\pip.exe" uninstall project-cylon -y
"%SCRIPT%\pip.exe" uninstall behave -y
"%SCRIPT%\pip.exe" uninstall pyyaml -y
"%SCRIPT%\pip.exe" uninstall selenium -y
"%SCRIPT%\pip.exe" uninstall colorama -y
REM "%SCRIPT%\pip.exe" install --upgrade six
"%SCRIPT%\pip.exe" install --upgrade selenium
"%SCRIPT%\pip.exe" install --upgrade colorama
"%SCRIPT%\pip.exe" install --upgrade pyyaml
"%SCRIPT%\pip.exe" install --upgrade behave
"%SCRIPT%\pip.exe" install --upgrade project-cylon
REM =====

%CURRENT_DRIVE%
cd "%~dp0..\sanity"
rmdir /S /Q ".\itruemart-sanity"
REM iTrueMart
git clone https://chawiwan_nin@bitbucket.org/chawiwan_nin/itruemart-sanity.git
REM welove
REM git clone xxx