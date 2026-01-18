@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

title @DIGO CMD

set "repeatCount=3"
set /a "currentCount=0"






net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Running as administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)


for /f "tokens=2 delims=," %%i in ('tasklist /FI "IMAGENAME eq HD-Player.exe" /FO CSV /NH') do (
    set "PID=%%~i"
)


if "%PID%"=="" (
    echo Process not found.
    exit /b 1
)

echo PID of HD-Player.exe is %PID%


set "currentPath=%~dp0"


powershell -command "Start-Process '\"%currentPath%crack.exe\"' -ArgumentList '\"%currentPath%s.1337\" -pid %PID% -force' -Verb RunAs"


if %errorLevel% EQU 0 (
    echo crack successfully :).
) else (
    echo Failed to crack :(.
)
echo.
echo Press any key to exit...
pause >nul

endlocal
