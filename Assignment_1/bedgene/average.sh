echo Calculating average...

mkdir ave_Sl_St
#combine files in columns of each group
paste Slender/*.count|
awk '{print $1"\t"($2+$4+$6+$8+$10+$12)/6}' > ave_Sl_St/Slenderave.count #output mean count of Slender
paste Stumpy/*.count|
awk '{print $1"\t"($2+$4+$6+$8+$10+$12)/6}' > ave_Sl_St/Stumpyave.count #output mean count of Stumpy
#write header
echo -e "#Gene_name\tSlenderTbb_mean_matches\tStumpyTbb_mean_matches" > ../statistics.txt 
#combine two groups into one file
paste ave_Sl_St/Slenderave.count ave_Sl_St/Stumpyave.count|
awk '{print $1"\t"$2"\t"$4}'>> ../statistics.txt

echo "Done! see the result in statistics.txt"
