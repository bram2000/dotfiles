function csvdiff --argument file1 file2
	if [ (count $argv) -ne 2 ]
echo "expected exactly two files to compare"
return 1
end
vimdiff (cat $file1 | csvlook -I | psub) (cat $file2 | csvlook -I | psub)
end
