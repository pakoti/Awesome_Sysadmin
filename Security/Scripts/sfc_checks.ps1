#needs -RunAsAdministrator
#to ckeck file system by using sfc


try {

	sfc /verifyOnly
	if ($lastExitCode -ne "0") { throw "'sfc /verifyOnly' failed" }

	"[*]checked Windows system files"
	exit 0 # successfully done!

} 
catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}