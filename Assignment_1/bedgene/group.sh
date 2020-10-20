cp /localdisk/data/BPSM/Assignment1/fastq/fqfiles ./

mkdir Slender Stumpy

ls calculatedir|sort|
while read count
do

while read num form fq1 fq2
do 
if [[ "$count" == "$num"* ]]
then
echo -e "$count is allocated to $form"
cp calculatedir/"$count" "$form"
fi
done < fqfiles

done
