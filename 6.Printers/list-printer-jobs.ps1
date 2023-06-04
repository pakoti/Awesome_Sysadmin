#run this script to list all jobs for each printer

$printers = Get-Printer
	if ($printers.Count -eq 0) { throw "No printer found" }

	foreach ($printer in $printers) {
		$PrinterName = $printer.Name
		$printjobs = Get-PrintJob -PrinterObject $printer
		if ($printjobs.Count -eq 0) {
			$PrintJobs = "none"
		} else {
			$PrintJobs = "$printjobs"
		}
		New-Object PSObject -Property @{ Printer=$PrinterName; Jobs=$PrintJobs }
	}