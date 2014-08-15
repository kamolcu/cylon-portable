@ECHO OFF

SET SITE_PACKAGES=%~dp0..\App\Lib\site-packages
SET SCRIPT=%~dp0..\App\Scripts
SET PATH=%SCRIPT%;%SITE_PACKAGES%;%PATH%
REM SETX PATH "%SCRIPT%;%SITE_PACKAGES%;%PATH%"
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

%CURRENT_DRIVE%
cd "%~dp0..\sanity"
cd itruemart-sanity

"%~dp0..\App\Scripts\cylon.exe" run all
pause