# Simple PowerShell Download Manager
function Get-DownloadManager {
    param(
        [string[]]$Urls,
        [string]$DownloadPath = "$HOME\Downloads",
        [int]$MaxConcurrentDownloads = 3
    )
    
    # Create download directory if it doesn't exist
    if (!(Test-Path $DownloadPath)) {
        New-Item -ItemType Directory -Path $DownloadPath -Force | Out-Null
    }
    
    # Download function with progress
    function Download-File {
        param($Url, $OutputPath)
        
        try {
            $fileName = [System.IO.Path]::GetFileName($Url)
            Write-Host "📥 Downloading: $fileName" -ForegroundColor Yellow
            
            Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UseBasicParsing
            return @{Success = $true; File = $OutputPath}
        }
        catch {
            return @{Success = $false; Error = $_.Exception.Message; File = $OutputPath}
        }
    }
    
    # Download all files
    $results = @()
    foreach ($url in $Urls) {
        $fileName = [System.IO.Path]::GetFileName($Url)
        $outputFile = Join-Path $DownloadPath $fileName
        $results += Download-File -Url $url -OutputPath $outputFile
    }
    
    # Show results
    Write-Host "`n=== Download Summary ===" -ForegroundColor Green
    $successCount = ($results | Where-Object { $_.Success -eq $true }).Count
    Write-Host "✅ Successful: $successCount" -ForegroundColor Green
    Write-Host "❌ Failed: $($results.Count - $successCount)" -ForegroundColor Red
    
    return $results
}

# Usage examples:
Get-DownloadManager -Urls "https://example.com/file1.zip", "https://example.com/file2.pdf"
Get-DownloadManager -Urls "https://example.com/file.zip" -DownloadPath "C:\MyDownloads"