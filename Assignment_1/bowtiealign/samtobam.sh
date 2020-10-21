echo "Working...creating bam files from sam, it will take some time..."

mkdir ../bowbam #dir for files of.bam format
#rename files with .bam end, but keep necessary information
IFS="." 
ls ../bowoutsam|sort|
# transform each .sam file to .bam
while read num fq sam 
do
samtools view -b -o ../bowbam/$num.bam ../bowoutsam/$num.$fq.$sam
done

echo "Done, bam files created to dir bowbam. Sam files are in dir bowoutsam"
