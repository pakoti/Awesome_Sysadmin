
#Run this script to cancel all printers jobs.

try {
	$printers = Get-Printer
	if ($printers.Count -eq 0) { throw "No printers found" }
		
	foreach ($printer in $printers) {
		$printjobs = Get-PrintJob -PrinterObject $printer
		foreach ($printjob in $printjobs) {
			Remove-PrintJob -InputObject $printjob
		}
	}

	"all printers jobs removed."
	exit 0     # success
} catch {
	"Error Line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"  #to find error
	exit 1
}