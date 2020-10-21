#creat new file and add header
echo -e "#Gene_name\tSlenderTbb_mean\tStumpyTbb_mean\tDifference\tFold\tIndicator">diff_fold.txt

while read name slender stumpy
do
if [[ $slender < 1 && $stumpy < 1 || $name == "#Gene_name" ]] 
then
continue #discard the data that is useless
else
if [[ $slender == 0 ]] 
then
slender=0.0001 #denominator cannot be 0
fi
if [[ $stumpy == 0 ]]
then
stumpy=0.0001 #denominator cannot be 0
fi
fi
echo -e "$name\t$slender\t$stumpy"
done<statistics.txt|

#compare the difference of gene expression between Slenderform and Stumpyform and calculate fold
awk '{FS="\t";
if(($2-$3) < 0)
{print $1"\t"$2"\t"$3"\t"($3-$2)"\t"($3/$2)"\t""-"}
else if(($2-$3) >= 0)
{print $1"\t"$2"\t"$3"\t"($2-$3)"\t"($2/$3)"\t""+"}
}' |sort -k4,4nr -k5,5nr >> diff_fold.txt #rank every gene in terms of difference and then fold

echo "Done, see result in diff_fold.txt"
