@echo off
tasklist | findstr /C:"sw.exe" > nul
if %errorlevel% == 1 (
    echo Jar program is not running.
) else (
    echo Jar program is running.
)
