#to list all printers jobs 

Get-WMIObject -Class Win32_Printer -ComputerName $(hostname) | Format-Table

