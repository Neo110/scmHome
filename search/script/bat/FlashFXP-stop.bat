@echo off
cd /D %~dp0
echo FlashFXP shutdowm ...

tasklist | findstr /C:"FlashFXP.exe" > nul
if %errorlevel% == 1 (
    echo FlashFXP is stop success
) else (
    net stop sshd

	if errorlevel 1 goto error
	goto finish

	:error
	echo.
	echo FlashFXP is stop failed
	echo FlashFXP could not be started
	pause

	:finish
	echo.
	echo FlashFXP is stop success
)


