mkdir Tbbgenomeindex
cp /localdisk/data/BPSM/Assignment1/Tbb_genome/Tb927_genome.fasta.gz ./
gunzip Tb927_genome.fasta.gz
bowtie2-build Tb927_genome.fasta Tbbgenomeindex/tbbgenome
