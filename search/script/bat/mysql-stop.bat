@echo off
cd /D %~dp0
echo Mysql shutdowm ...

for /f "tokens=2,9" %%a in ('tasklist -V ^|findstr "mysqld.exe"') do (
	echo "Mysql PID %%a"
	taskkill /F /PID %%a
)
if %errorlevel% == 1 (
	goto error
) else (
	goto finish
)


if not exist mysql\data\%computername%.pid GOTO exit
echo Delete %computername%.pid ...
del mysql\data\%computername%.pid

:error
echo Mysql is stop failed.
exit /b 1
 
:finish
echo Mysql is stop success.
exit /b 0
