@ECHO OFF

SET SITE_PACKAGES=%~dp0..\App\Lib\site-packages
SET SCRIPT=%~dp0..\App\Scripts
SET PATH=%SCRIPT%;%SITE_PACKAGES%;%PATH%
REM SETX PATH "%SCRIPT%;%SITE_PACKAGES%;%PATH%"
SET CURRENT_PATH=%~dp0
SET CURRENT_DRIVE=%CURRENT_PATH:~0,2%

%CURRENT_DRIVE%
ECHO WELOVE_SANITY ...
cd "%~dp0..\sanity"
cd projectwls-sanity
"%~dp0..\App\Scripts\cylon.exe" run all

ECHO ITRUEMART SANITY ...
cd "%~dp0..\sanity"
cd itruemart-sanity
"%~dp0..\App\Scripts\cylon.exe" run all
pause