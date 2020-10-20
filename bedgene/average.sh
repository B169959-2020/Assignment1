mkdir ave_Sl_St

paste Slender/*.count|
awk '{print $1"\t"($2+$4+$6+$8+$10+$12)/6}' > ave_Sl_St/Slenderave.count

paste Stumpy/*.count|
awk '{print $1"\t"($2+$4+$6+$8+$10+$12)/6}' > ave_Sl_St/Stumpyave.count

echo -e "#Gene_name\tSlenderTbb_mean_matches\tStumpyTbb_mean_matches" > statistics.txt

paste ave_Sl_St/Slenderave.count ave_Sl_St/Stumpyave.count|
awk '{print $1"\t"$2"\t"$4}'>> statistics.txt
