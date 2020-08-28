function csvdiff --argument file1 file2 columns
set cut_arg ""
if [ (count $argv) -eq 3 ]
set cut_arg -c "$columns"
else if [ (count $argv) -ne 2 ]
echo "expected exactly two files to compare"
return 1
end
if [ "$cut_arg" = "" ]
eval vimdiff (cat $file1 | csvlook -I | psub) (cat $file2 | csvlook -I | psub)
else
eval vimdiff (cat $file1 | csvcut $cut_arg | csvlook -I | psub) (cat $file2 | csvcut $cut_arg | csvlook -I | psub)
end
end
