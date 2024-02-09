$file = read-host "Enter the filename" 

$Result = get-filehash $file -algorithm SHA1

" SHA1 hash is $($Result.Hash)"