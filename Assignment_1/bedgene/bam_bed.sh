echo bedtools working...

mkdir calculatedir #a dir for output of bedtools
cp /localdisk/data/BPSM/Assignment1/Tbbgenes.bed ./
IFS=$'\t'
#bedtools each .bam files with Tbbgenes.bed to find matched genes of each sample
ls ../bowbam|sort|
while read bam
do
bedtools intersect -a Tbbgenes.bed -b  ../bowbam/$bam -c| #-c count the number of matches of each gene
while read c1 c2 c3 name c5 c6 count # output only gene names and each count
do
if [[ $c5 == "gene" ]] #output only genes
then
echo -e "$name\t$count" 
fi
done > calculatedir/$bam.count 
done

echo "Done! Matches are counted."










