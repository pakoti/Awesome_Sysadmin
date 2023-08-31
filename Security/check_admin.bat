@echo off
net.exe session 1>NUL 2>NUL || goto :not_admin
echo You are local administrator
goto :eof

:not_admin
echo ERROR: Please run as a local administrator.
exit /b 1