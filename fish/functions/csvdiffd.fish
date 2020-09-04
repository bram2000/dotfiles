# Defined in /var/folders/6p/8kl8_gt54jv2vsgw_8brmpdm0000gn/T//fish.6bhMI1/csvdiffd.fish @ line 2
function csvdiffd --argument src dest cut ignore
set file_list (ls $src/*.csv)
set total (echo $file_list | wc -w | string trim)
set differences 0
set checked 0
set skipped 0
set problems ""

if test "$cut" = "auto"
set auto_cut on
else
set auto_cut off
end

echo "$total files to compare in total [auto_cut is $auto_cut]"

for f in $file_list
    set filename (basename $f)
    if test "$auto_cut" = "on"
        if test -n "$ignore"
            set columns (csvcut -n $f | grep -v "$ignore" | awk '{print $2}' | paste -d ',' -s -)
        else
            set columns (csvcut -n $f | awk '{print $2}' | paste -d ',' -s -)
        end
    end

    if test -f $dest/$filename
        diff (cat $f | csvcut -c $columns | psub) (cat $dest/$filename | csvcut -c $columns | psub)

          if test $status -ne 0
              echo  diff $f $dest/$filename
              set differences (math "$differences + 1")
              set -a problems $filename
          end
    else
        echo $dest/$filename not found
        set skipped (math "$skipped + 1")
    end
    set checked (math "$checked + 1")
    echo "$checked comparisons completed [of $total]"
end
if test $differences -gt 1
    echo "differences were found when comparing the following files:"
    echo "$problems" | tr ' ' '\n'
end
echo "$differences differences found in $total comparisons"
end
