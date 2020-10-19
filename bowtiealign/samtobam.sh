mkdir bowbam
IFS="."
ls bowoutsam|sort|
while read num fq sam
do
samtools view -b -o bowbam/$num.bam bowoutsam/$num.$fq.$sam
done
