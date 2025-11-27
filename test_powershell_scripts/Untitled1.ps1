try {
    Invoke-WebRequest -Uri "https://github.com/pakoti/DIY-smart-home.git" -OutFile "DIY-smart-home.git" -ErrorAction Stop
    Write-Host "Download successful!" -ForegroundColor Green
}
catch {
    Write-Host "Download failed: $($_.Exception.Message)" -ForegroundColor Red
}