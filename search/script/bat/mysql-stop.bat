@echo off
cd /D %~dp0
echo Mysql shutdowm ...

for /f "tokens=2,9" %%a in ('tasklist -V ^|findstr "mysqld.exe"') do (
	echo "Mysql PID %%a"
	taskkill /F /PID %%a
)
if %errorlevel% == 1 goto error
goto finish

if not exist mysql\data\%computername%.pid GOTO exit
echo Delete %computername%.pid ...
del mysql\data\%computername%.pid
:error
echo.
echo Mysql 停止失败
echo Mysql could not be started
pause
 
:finish
echo.
echo Mysql is stop success!
