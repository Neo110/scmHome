@echo off

jps -l | findstr /C:"org.apache.catalina.startup.Bootstrap" > nul
if %errorlevel% == 1 (
    echo Jar program is not running.
) else (
    echo Jar program is running.
)
