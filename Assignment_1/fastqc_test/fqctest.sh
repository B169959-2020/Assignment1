#run fastqc with data of dir fastq, output to dir fqcoutput
mkdir fqcoutput
fastqc --extract -o fqcoutput /localdisk/data/BPSM/Assignment1/fastq/*.fq.gz 


ls fqcoutput|
while read file_name
do
if [[ $file_name == *".html" || $file_name == *".zip" ]] #chose the readable files for next steps
then
continue
else
echo $file_name
fi
done|sort>dirlist.txt

echo -e "Wellcome!\n">../result_assessment.txt #just to start a new text 

while read dir_name
do
#assign the form names of T.b.b to each result
while read num stage q1 q2 
do
if [[ "$dir_name" == *"$num"* ]]
then 
form=$stage
fi
done</localdisk/data/BPSM/Assignment1/fastq/fqfiles

echo -e "\nThis is the result of $dir_name($form):">>../result_assessment.txt

Q=0    #set original parameter for printing
# search for information relecant to quality and total sequences
while read line
do
if [[ $line == *"Total Sequences"* ]]
then
echo ">>$line"
fi

if [[ $line == *"Sequences flagged as poor quality"* ]]
then
echo ">>$line"
fi

if [[ $line == *"Per sequence quality scores"* ]]
then
echo ">Per sequence quality scores"
Q=1     #set a parameter to print following lins
continue
fi

if [[ $line == ">>END_MODULE" ]]
then
Q=0     #stop printing at the end of each part
fi

if [[ $Q == 1 ]] 
then
echo $line
fi

done<fqcoutput/$dir_name/fastqc_data.txt>>../result_assessment.txt

done<dirlist.txt

echo "Done! see the quality report in result_assessment.txt"
