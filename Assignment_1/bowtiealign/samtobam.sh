echo "Working...creating bam files from sam, it will take some time..."
mkdir ../bowbam
IFS="."
ls ../bowoutsam|sort|
while read num fq sam
do
samtools view -b -o ../bowbam/$num.bam ../bowoutsam/$num.$fq.$sam
done
echo "Done, bam files created to dir bowbam. Sam files are in dir bowoutsam"
