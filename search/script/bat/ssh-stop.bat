@echo off
cd /D %~dp0
echo OpenSSH shutdowm ...

tasklist | findstr /C:"sshd.exe" > nul
if %errorlevel% == 1 (
    echo OpenSSH is stop success
) else (
    net stop sshd

	if errorlevel 1 goto error
	goto finish

	:error
	echo.
	echo OpenSSH is stop failed
	echo OpenSSH could not be started
	pause

	:finish
	echo.
	echo OpenSSH is stop success
)


