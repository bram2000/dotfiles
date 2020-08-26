function jsondiff --argument file1 file2
	if [ (count $argv) -ne 2 ]
echo "expected exactly two files to compare"
return 1
end
vimdiff (cat $file1 | jq | psub) (cat $file2 | jq | psub)
end
