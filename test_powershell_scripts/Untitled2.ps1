$url = "https://micropython.org/resources/source/micropython-1.26.1.tar.xz"
$output = "C:\Users\JohnSnow\Downloads\micropython-1.26.1.tar.xz"

# Shows progress bar automatically
Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing
Write-Host "Download completed!" -ForegroundColor Green