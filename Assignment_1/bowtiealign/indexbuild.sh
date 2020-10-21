mkdir Tbbgenomeindex #make a dir for Tbbgeno database
cp /localdisk/data/BPSM/Assignment1/Tbb_genome/Tb927_genome.fasta.gz ./
gunzip Tb927_genome.fasta.gz 
#build a Tbbgenome database
bowtie2-build Tb927_genome.fasta Tbbgenomeindex/tbbgenome 
