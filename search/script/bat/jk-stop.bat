@echo off
cd /D %~dp0
echo jk shutdowm ...

for /f "usebackq tokens=1-5" %%a in (`jps -l`) do (
	echo %%a %%b
	if [%%b] EQU [agent.jar] (
		echo stop %%a
		taskkill /F /PID %%a
	)
)


if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo jk is stop failed.
exit /b 1

:finish
echo jk is stop success.
exit /b 0