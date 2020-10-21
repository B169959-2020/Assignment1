cp /localdisk/data/BPSM/Assignment1/fastq/fqfiles ./ #import reference for allocating files to each group

mkdir Slender Stumpy #separate samples into corresponding groups

ls calculatedir|sort| #list .count files,the output of bedtools. 
while read count
do

while read num form fq1 fq2 # match files, refer information in fqfiles
do 
#assign files to a dir when the filename matches, for example, 222_L8_1.bam.count == 222*,which is Stumpy
if [[ "$count" == "$num"* ]] 
then
echo -e "$count is allocated to $form"
cp calculatedir/"$count" "$form" #cope .count files to each group of forms
fi
done < fqfiles

done
