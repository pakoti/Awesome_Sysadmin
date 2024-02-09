$file = read-host "Enter the filename" 

$Result = get-filehash $file -algorithm SHA256

" SHA1 hash is $($Result.Hash)"