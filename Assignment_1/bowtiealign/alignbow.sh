echo "align working..."
mkdir unzip_fq #make a dir for unzipped fastq sequences
mkdir ../bowoutsam #make a dir for output of bowtie2
cp -r /localdisk/data/BPSM/Assignment1/fastq/*.gz unzip_fq #copy only .gz files
gunzip unzip_fq/*.gz 

ls unzip_fq|sort| 
#align each group with bowtie2
while read file
do
# -p 8, align with 8 threads. make it faster
bowtie2 -p 8 -x Tbbgenomeindex/tbbgenome unzip_fq/$file -S ../bowoutsam/$file.sam
done
echo "Alignment Done!"
