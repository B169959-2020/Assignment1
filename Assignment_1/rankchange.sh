#creat new file and add header
echo -e "#Gene_name\tSlenderTbb_mean\tStumpyTbb_mean\tDifference\tFold\tIndicator">diff_fold.txt

while read name slender stumpy
do
#set parameter to discard the data that is useless
if [[ $slender < 5 && $stumpy < 5 || $name == "#Gene_name" ]] 
then
continue 
else
if [[ $slender == 0 ]] 
then
slender=0.0001 #denominator below cannot be 0
fi
if [[ $stumpy == 0 ]]
then
stumpy=0.0001 #denominator below cannot be 0
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
}' |
#rank every gene in terms of difference and fold, the top 100 genes are those significantly changed after transformation.
sort -k4nr|head -1000|sort -k5nr|head -100 >> diff_fold.txt 

echo "Done, see result in diff_fold.txt"
