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

done<~/assignment1/results/216_L8_1_fastqc/fastqc_data.txt
