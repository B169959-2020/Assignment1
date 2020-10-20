echo bedtools working...

mkdir calculatedir
cp /localdisk/data/BPSM/Assignment1/Tbbgenes.bed ./
IFS=$'\t'

ls ../bowbam|sort|
while read bam
do
bedtools intersect -a Tbbgenes.bed -b  ../bowbam/$bam -c|
while read c1 c2 c3 name c5 c6 count
do
if [[ $c5 == "gene" ]]
then
echo -e "$name\t$count" 
fi
done > calculatedir/$bam.count
done

echo "Done! Matches are counted."










