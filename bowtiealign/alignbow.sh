mkdir unzip_fq
cp -r /localdisk/data/BPSM/Assignment1/fastq/*.gz unzip_fq
gunzip unzip_fq/*.gz 

ls unzip_fq|sort| 
#align each group
while read file
do
# -p 8, align with 8 threads. make it faster
bowtie2 -p 8 -x Tbbgenomeindex/tbbgenome unzip_fq/$file -S $file.sam
done
