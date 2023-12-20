@echo off
tasklist | findstr /C:"redis-server.exe" > nul
if %errorlevel% == 1 (
    echo Jar program is not running.
) else (
    echo Jar program is running.
)
