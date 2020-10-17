cd ~/assignment1/results
ls|sort>~/assignment1/resultlist.txt
echo -e "Wellcome!\n">~/assignment1/assessment.txt
while read dir_name
do
if [[ $dir_name == *".html" || $dir_name == *".zip" ]]
then
continue
else
echo -e "\nThis is the result of $dir_name:">>~/assignment1/assessment.txt
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
fi
done<~/assignment1/resultlist.txt
