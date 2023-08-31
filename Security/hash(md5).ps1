$file = read-host "Enter the filename" 

$Result = get-filehash $file -algorithm MD5

" SHA1 hash is $($Result.Hash)"