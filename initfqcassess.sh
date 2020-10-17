mkdir results
fastqc --extract -o results /localdisk/data/BPSM/Assignment1/fastq/*.fq.gz

ls ~/assignment1/results|
while read file_name
do
if [[ $file_name == *".html" || $file_name == *".zip" ]]
then
continue
else
echo $file_name
fi
done|sort>~/assignment1/dirlist.txt

echo -e "Wellcome!\n">~/assignment1/assessment.txt #just to start a new file

while read dir_name
do
#assign the form of T.b. to each result
while read num stage q1 q2 
do
if [[ "$dir_name" == *"$num"* ]]
then 
form=$stage
fi
done</localdisk/data/BPSM/Assignment1/fastq/fqfiles

echo -e "\nThis is the result of $dir_name($form):">>~/assignment1/assessment.txt

Q=0    #set original parameter for printing
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
Q=0     #stop printing at each end
fi

if [[ $Q == 1 ]] 
then
echo $line
fi

done<~/assignment1/results/$dir_name/fastqc_data.txt>>~/assignment1/assessment.txt

done<~/assignment1/dirlist.txt
