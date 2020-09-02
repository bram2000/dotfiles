# Defined in /var/folders/6p/8kl8_gt54jv2vsgw_8brmpdm0000gn/T//fish.jq4GEA/csvdiff.fish @ line 2
function csvdiff --argument file1 file2 columns ignore
set cut_arg ""
if [ (count $argv) -gt 2 ]
    if test "$columns" = "auto"
        if test -n "$ignore"
            set cut_arg -c (csvcut -n $file1 | awk '{print $2}' | grep -v "$ignore" | paste -d ',' -s -)
        else
            set cut_arg -c (csvcut -n $file1 | awk '{print $2}' | paste -d ',' -s -)
        end
    else
        set cut_arg -c "$columns"
    end
else if [ (count $argv) -lt 2 ]
echo "expected exactly two files to compare"
return 1
end
if [ "$cut_arg" = "" ]
eval vimdiff (cat $file1 | csvlook -I | psub) (cat $file2 | csvlook -I | psub)
else
eval vimdiff (cat $file1 | csvcut $cut_arg | csvlook -I | psub) (cat $file2 | csvcut $cut_arg | csvlook -I | psub)
end
end
