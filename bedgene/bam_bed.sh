cp /localdisk/data/BPSM/Assignment1/Tbbgenes.bed ./
IFS=$'\t'
bedtools intersect -a Tbbgenes.bed -b  ../bowtiealign/bowbam/222_L8_1.bam -c|
while read c1 c2 c3 name c5 c6 count
do
if [[ $c5 == "gene" ]]
then
echo -e "$name\t$count" 
fi
done
