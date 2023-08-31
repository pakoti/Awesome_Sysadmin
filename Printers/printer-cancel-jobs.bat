

net stop spooler
del /F /S /Q %systemroot%\System32\spool\PRINTERS\*
net start spooler