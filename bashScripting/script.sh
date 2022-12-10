#! /bin/bash

# --> '#!' = SHABANG! --> indicates the path where the interpreter that is
#		  	  capable of executing -among others- .sh files is located			  
#		          if we make the file executable and add it to usr/bin, then
# 			  we won't need to specify `#! /bin/bash` at the begining of the script




#__________________________
## Hello Bash Script:

#echo 'Hello Fellas!'

#__________________________
## Commented line:

#this is one of my first bash scripts!

#__________________________
## Multiple commented lines:

: '
multiple commented lines
multiple commented lines
multiple commented lines
multiple commented lines
multiple commented lines
multiple commented lines'

#__________________________
## Redirecting to file:

#echo 'Hello Fellas!' > file.txt  --> redirects (overwritting) 'Hello Fellas' on the existing/new file.txt
#echo 'Hello Fellas!' >> file.txt --> redirects (appending) 'Hello Fellas' on the existing/new file.txt

#__________________________
## Here Doc:

: '
cat << _EOF_
This is a "hereDoc"
piece of code
_EOF_ '

#__________________________
## Conditional Statements:
: '
count=9

if [ $count -eq 0 ] # we can also use
       		    # -ne --> non equal to
		    # -gt --> greater than	
		    # -lt --> less than
		    # >< --> grater/less than --> u will have to replace [] for (())
then 
	echo "firt condition is true"

elif (( $count <= 8 ))
then
	echo "second condition is true"
 		
else
	echo "all conditions are false"
fi'

#_________
# AND/OR
: '
age=18

if [ $age -gt 18 -a $age -lt 40 ] # OR -->  if [ $age -gt 18 -o $age -lt 40 ]
       				  
then
	echo "age is correct"
else
  	echo "age is not correct"
fi'

#___________________
#WHILE/UNTIL

: '
number=1

while [ $number -lt 10 ] # we can also use "until"
do
	echo "$number"
	number=$(( number+1 ))
done'

#___________________
#FOR

: '
for i in 1 2 3 4 5 6 #1 2 3 4 5 6 # --> {1..6..2} --> {start,end,increment}
do
	echo $i
done'

#___________________
#BREAK/CONTINUE

: '
for i in 1 2 3 4 5 6
do
	if [ $i -gt 4 ]
	then	
		break
	fi	

	echo $i
done

echo -e "\n"

for i in 1 2 3 4 5 6
do
	if [ $i -eq 2 -o $i -eq 4 ]
	then	
		continue
	fi	

	echo $i
done


echo -e "\n"


for i in 1 2 3 4 5 6
do
	if [ `expr $i % 2` != 0 ] # --> use `expr` to declare an arithmetic operation
	then	
		continue
	fi	

	echo $i
done'

#____________________
#SCRIPT INPUT/OUTPUT


: '
echo $1 $2 $3 # --> prints out index 1,2,3 from stdin array

echo -e "\n"

args=("$@") # --> stdin array

echo ${args[0]}	 ${args[2]} ${args[4]} # --> prints out index 0,2,4 from stdin array

echo -e "\n"

echo $@ # --> prints out all on the stdin array

echo -e "\n"

echo $# # --> prints out the lenght of the stdin array'


#____________________________
# EXPORTING A VARIABLE...

: '
MESSAGE="Fellaaaaaaaaaaaaas!"

export MESSAGE
./script2.sh'


#______________________________________
# READ, STRING COMPARE, UPPER/LOWER

: '
echo -n "Enter first string: "
read str1

echo -n "Enter second string: "
read str2
 
if [ $str1 == $str2 ]
then
	echo "Strings match"
else
	echo "String does not match"

fi 

echo -e "\n"

unset $st1 $st2

echo -n "Enter first string: "
read str1

echo -n "Enter second string: "
read str2

if [ "$str1" \> "$str2" ]
then
	echo "$str1 is longer than $str2"
elif [ "$str1" \< "$str2" ]		
then
	echo "$str2 is longer than $str1"		
else
	echo "$str1 & $str2 both are the same lenght"
fi


concatenation=$str1" "$str2

echo -e "\n"
echo $concatenation
echo ${concatenation^} # --> lowercases everything but the 1st letter
echo ${concatenation^^} # --> uppercases everything'

#________________________________
#ARITHMETICS...

: '
echo `expr 2 + 2` 
echo `expr 2 - 2` 
echo `expr 2 \* 2` 
echo `expr 2 / 4`
echo `expr 2 % 2`'


#____________________________
#DECLARE COMMAND

# most used to declare `readonly` variables (-r), but...
# type 'declare --help to check other features'

: '
declare -r path1=/mnt/c/
echo $path1
path1=/home/kira # --> will throw `readonly` variable error
echo $path1'


#______________________________
#ARRAYS!

cars=('BMW' 'Toyota' 'Dodge')

echo "${cars[2]}"
echo "${cars[0]}"
echo "${cars[1]}"
echo "${cars[@]}"
echo "${#cars[@]}"
echo "${!cars[@]}"

unset cars[1]
echo -e "\n" 
echo "After removing Toyota..." 

echo "${cars[2]}"
echo "${cars[0]}"
echo "${cars[1]}"
echo "${cars[@]}"
echo "${#cars[@]}"
echo "${!cars[@]}"

echo -e "\n" 

cars[1]="Lambo"
echo "After replacing Toyota..."

echo "${cars[2]}"
echo "${cars[0]}"
echo "${cars[1]}"
echo "${cars[@]}"
echo "${#cars[@]}"
echo "${!cars[@]}"


















