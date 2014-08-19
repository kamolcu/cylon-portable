@ECHO OFF
REM Assume this file is in 'cylon-portable' directory

SET APP=%~dp0..\App
SET SCRIPT=%~dp0..\App\Scripts
SET GIT_ENV=%~dp0..\App\GitPortable\App\Git\bin
REM SET PATH=%APP%;%SCRIPT%;%GIT_ENV%;%PATH%
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

REM ===== Ansicon installation

SET RegQry=HKLM\Hardware\Description\System\CentralProcessor\0
REG.exe Query %RegQry% > checkOS.txt
FIND /i "x86" < CheckOS.txt > StringCheck.txt
IF %ERRORLEVEL% == 0 (
    ECHO "This is 32 Bit Operating system"
    SET PREFIX=x86
) ELSE (
    ECHO "This is 64 Bit Operating System"
    SET PREFIX=x64
)

SET TARGETANSICONPATH=C:\ansicon\%PREFIX%
IF NOT EXIST %TARGETANSICONPATH% (
    MKDIR %TARGETANSICONPATH%
)

IF NOT EXIST %TARGETANSICONPATH%\ansicon.exe (
    COPY /V /Y /Z "%CURRENT_PATH%ansicon\%PREFIX%\*.*" %TARGETANSICONPATH%"
    %TARGETANSICONPATH%\ansicon.exe -i
)

REM ===== Update project-cylon
"%APP%\python.exe" "%~dp0..\App\Lib\site-packages\easy_install.py" pip
"%APP%\python.exe" "%~dp0..\App\Lib\site-packages\easy_install.py" six
"%SCRIPT%\pip.exe" uninstall project-cylon -y
"%SCRIPT%\pip.exe" uninstall behave -y
"%SCRIPT%\pip.exe" uninstall pyyaml -y
"%SCRIPT%\pip.exe" uninstall selenium -y
"%SCRIPT%\pip.exe" uninstall colorama -y
"%SCRIPT%\pip.exe" install --upgrade selenium
"%SCRIPT%\pip.exe" install --upgrade colorama
"%SCRIPT%\pip.exe" install --upgrade pyyaml
"%SCRIPT%\pip.exe" install --upgrade behave
"%SCRIPT%\pip.exe" install --upgrade project-cylon
"%APP%\python.exe" -m compileall
REM =====

%CURRENT_DRIVE%
cd "%~dp0..\sanity"

rmdir /S /Q ".\projectwls-sanity"
REM welove
"%~dp0..\App\GitPortable\App\Git\bin\git.exe" clone  https://sujitra_janleela@bitbucket.org/sujitra_janleela/projectwls-sanity.git

rmdir /S /Q ".\itruemart-sanity"
REM iTrueMart
"%~dp0..\App\GitPortable\App\Git\bin\git.exe" clone https://chawiwan_nin@bitbucket.org/chawiwan_nin/itruemart-sanity.git


