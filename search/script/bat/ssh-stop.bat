@echo off
cd /D %~dp0
echo OpenSSH shutdowm ...

tasklist | findstr /C:"sshd.exe" > nul
if %errorlevel% == 1 (
    goto error
) else (
	
    net stop sshd
	if errorlevel 1 (
		goto error
	) else (
		goto finish
	)

)

:error
echo OpenSSH is stop failed.
exit /b 1

:finish
echo OpenSSH is stop success.
exit /b 0