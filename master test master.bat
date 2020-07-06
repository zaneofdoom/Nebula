@echo off
title Nebula Master Test

:start
color 0a
cls

type icon1.txt
echo.
echo.
echo OPTIONS:
echo.
echo Password
echo.
set /p MAIN=Select a menu:
goto %MAIN%



:password
cls
echo Password Menu:
echo.
echo Create
echo.
echo Check
echo.
set /p PASSMENU=Select a submenu:
goto %PASSMENU%




:create
cls
set /p PCREATE=Enter your new password:
cls
echo %PCREATE%
set /p PNEWCHECK=Is this correct? (y or n)

if %PNEWCHECK%==n goto create

if %PNEWCHECK%==y echo Setting Password...
echo %PCREATE% > passlist.txt
pause
goto start





:check
cls
set /p PASSCHECK= What is your password?

for /f "Delims=" %%a in (passlist.txt) do (

set REALPASS=%%a

)

if %PASSCHECK%==%REALPASS% goto checkclear
echo Wrong password inputted.
pause
goto check


:checkclear
echo Correct password inputted.
pause
goto start

