[CmdLetBinding()]
Param(
    [string]$ComputerName,    
    [PSCredential]$AccessAccount
)

try{
    [string[]]$Script:Header = @("SessionName","UserName","ID","Status","Type","Device") 
    $Script:result
    $Script:output = @()

    if([System.String]::IsNullOrWhiteSpace($ComputerName) -eq $true){
        $Script:result = qwinsta | ForEach-Object { (($_.Trim() -replace "\s+",","))} | ConvertFrom-Csv -Header $Script:Header
    }
    else {
        if($null -eq $AccessAccount){            
            $Script:result = Invoke-Command -ComputerName $ComputerName -ScriptBlock{
                (qwinsta | ForEach-Object { (($_.Trim() -replace "\s+",","))} | ConvertFrom-Csv -Header $Using:Header) 
            } -ErrorAction Stop
        }
        else {
            $Script:result = Invoke-Command -ComputerName $ComputerName -Credential $AccessAccount -ScriptBlock{
                (qwinsta | ForEach-Object { (($_.Trim() -replace "\s+",","))} | ConvertFrom-Csv -Header $Using:Header) 
            } -ErrorAction Stop
        }
    }      
    foreach($item in $Script:result){
        if(([System.Char]::IsLetter($item.UserName.ToCharArray()[0])) -and `
            [System.Char]::IsDigit($item.ID.ToCharArray()[0])){
            $Script:output += $item            
        }
    }
    
    if($SRXEnv) {
        $SRXEnv.ResultMessage = $Script:output
    }
    else{
        Write-Output $Script:output
    }
}
catch{
    throw
}
finally{
}
