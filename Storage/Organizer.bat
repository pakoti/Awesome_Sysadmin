@echo off
for %%a in (".\*") do (
if "%%~xa" NEQ "" if "%%~dpxa" NEQ "%~dpx0" (
if not exist "%%~xa" mkdir "%%~xa"
move "%%a" "%%~dpa%%~xa\"
))