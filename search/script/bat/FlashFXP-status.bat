@echo off
tasklist | findstr /C:"FlashFXP.exe" > nul
if %errorlevel% == 1 (
    echo Jar program is not running.
) else (
    echo Jar program is running.
)
