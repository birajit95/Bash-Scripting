#! /bin/bash -x

# Set 1
#=============================

# 1. Use Random Function to get single digit
echo $(( RANDOM%10))

#======================


# 2. use random number to get Dice number between 1 to 6
echo $(( RANDOM%6 +1 ))

#=============================


# 3. Add 2 Random dice number and print the result
diceNumberOne=$(( RANDOM%6 +1 ))

diceNumberTwo=$(( RANDOM%6 +1 ))

result=$(( diceNumberOne+diceNumberTwo ))
echo $result

#====================================



# 4. Write a program that reads 5 Random 2 digit values, then find their sum and avarage

read -n 2 -p "Enter value of number 1 :" number_1  # -n 2 restricts to 2 digit input only
echo
read -n 2 -p "Enter value of number 2 :" number_2 
echo
read -n 2 -p "Enter value of number 3 :" number_3 
echo
read -n 2 -p "Enter value of number 4 :" number_4 
echo
read -n 2 -p "Enter value of number 5 :" number_5 
echo

sum=$(( number_1+number_2+number_3+number_4+number_5 ))
avarage=`awk 'BEGIN{printf "%.2f", ( '$sum'/5 ) }'`

echo "sum of the numbers " $sum
echo "Avarage of the numbers " $avarage

#===========================================================



# 5. Unit Conversion

#PART_1

INCH=42
FEET_THRESHOLD=12
FEET=`awk 'BEGIN{printf "%.1f", ( '$INCH'/'$FEET_THRESHOLD' ) }'`
echo "$INCH = $FEET Feet"



#PART_2

SQUARE_FEET_THRESHOLD=10.7639 # 1 meter square = 10.7639 square feet
plotLength=60 #feet
plotBredth=40 #feet

plotArea=$(( plotLength*plotBredth ))
plotAreaInMeter=`awk 'BEGIN{printf "%.5f", ( '$plotArea'/'$SQUARE_FEET_THRESHOLD' ) }'`

echo "$plotLength X $plotBredth Feet = $plotAreaInMeter square meter"

#PART_3

numberOfPlot=25
SQUARE_METER_THRESHOLD=4046.86 # 1 acre = 4046.86 square meter

totalAreaInSqMeter=`awk 'BEGIN{printf "%.5f", ( '$plotAreaInMeter' * '$numberOfPlot' ) }'`

totalAreaInAcre=`awk 'BEGIN{printf "%.5f", ( '$totalAreaInSqMeter' / '$SQUARE_METER_THRESHOLD' ) }'`

echo "Total area of $numberOfPlot plots = $totalAreaInAcre acre"

#============================================================================
#============================================================================


# ======================= SET 2 ============================



# 1. Write a program that reads 5 Random 3 Digit values
# and then outputs the minimum and the maximum value

value_1=$(( RANDOM%900 + 100))  # (0 to 899) + 100 always produce 3 digit
value_2=$(( RANDOM%900 + 100))
value_3=$(( RANDOM%900 + 100))


max=0
min=0

#taking 3 values as the comparisons became lenthy
echo $value_1  
echo $value_2
echo $value_3

# finding maximum
if [[ $value_1 -gt $value_2 && $value_1 -gt $value_3 ]]
then
    max=$value_1
fi
if [[ $value_2 -gt $value_1 && $value_2 -gt $value_3 ]]
then
    max=$value_2
fi
if [[ $value_3 -gt $value_1 && $value_3 -gt $value_2 ]]
then
    max=$value_3  
fi 

#finding minimum
if [[ $value_1 -lt $value_2 && $value_1 -lt $value_3 ]]
then
    min=$value_1
fi
if [[ $value_2 -lt $value_1 && $value_2 -lt $value_3 ]]
then
    min=$value_2
fi
if [[ $value_3 -lt $value_1 && $value_3 -lt $value_2 ]]
then
    min=$value_3  
fi


echo 
echo "Maximum value = $max"
echo "Minimum value = $min"

#===========================================================================

# 2. Write a program that takes day and month from the command line and prints true if
# day of month is between March 20 and June 20, false otherwise.

day=$1
month=$2
status="false"

if [[ $month -eq 3 && $day -ge 20 && $day -le 31 ]] #for March
then
   status="true"
fi

if [[ $month -eq 4 && $day -ge 1 && $day -le 30 ]] #for April
then
   status="true"
fi 

if [[ $month -eq 5 && $day -ge 1 && $day -le 31 ]] #for May
then
   status="true"
fi 
if [[ $month -eq 6 && $day -ge 1 && $day -le 20 ]] #for Jun
then
   status="true"
fi  

echo $status
    
#====================================================================

# 3. Write a program that takes a year as input and outputs the Year is a Leap Year or not
#a Leap Year. A Leap Year checks for 4 Digit Number, Divisible by 4 and not 100 unless
#divisible by 400.


echo "Enter the Year : "
read -n 4 year  # -n 4 restricts to 4 digit only
echo
leap_year='false'


if [[ $(( year%4 )) -eq 0 && $(( year%100 )) -ne 0 || $(( year%400 )) -eq 0 ]]
then
    leap_year='true'    
fi

if [ $leap_year = 'true' ]
then
    echo "$year is a Leap-Year"
else
    echo "$year is not a Leap-Year"
fi    


#=========================================================

# 4. Write a program to simulate a coin flip and print out "Heads" or "Tails" accordingly.

flip_status='None'

if [ $(( RANDOM%2 )) -eq 1 ]
then
    flip_status="Head"
else
    flip_status="Tail"
fi
echo $flip_status        


#===================================================
#===================================================

# Selection Practice Problems with if, elif and else

# 1. Read a single digit number and write the number in word

read -p "Enter a value between 0 to 9 : " single_digit_value

value_in_word="None"

if [ $single_digit_value -eq 0 ]
then
    value_in_word="Zero"
elif [ $single_digit_value -eq 1 ]
then
    value_in_word="One"
elif [ $single_digit_value -eq 2 ]
then
    value_in_word="Two"
elif [ $single_digit_value -eq 3 ]
then
    value_in_word="Three" 
elif [ $single_digit_value -eq 4 ]
then
    value_in_word="Four"
elif [ $single_digit_value -eq 5 ]
then
    value_in_word="Five"
elif [ $single_digit_value -eq 6 ]
then
    value_in_word="Six"
elif [ $single_digit_value -eq 7 ]
then
    value_in_word="Seven"
elif [ $single_digit_value -eq 8 ]
then
    value_in_word="Eight"
elif [ $single_digit_value -eq 9 ]
then
    value_in_word="Nine"
else
    value_in_word="a two digit number"   
fi
echo "You enterd $value_in_word "

#=====================================

# 2. Read a Number and Display the week day (Sunday, Monday,...)
read -p "Enter Day Number from 1 to 7 : "  day_number
day_in_word="None"

if [ $day_number -eq 1 ]
then
    day_in_word="Monday"
elif [ $day_number -eq 2 ]
then
    day_in_word="Tuesday"
elif [ $day_number -eq 3 ]
then
    day_in_word="Wednessday"
elif [ $day_number -eq 4 ]
then
    day_in_word="Thursday" 
elif [ $day_number -eq 5 ]
then
    day_in_word="Friday"
elif [ $day_number -eq 6 ]
then
    day_in_word="Saturday"
elif [ $day_number -eq 7 ]
then
    day_in_word="Sunday"
else
    day_in_word="wrong input"
fi    
echo "You entered $day_in_word "
#==================================

# 3. Read a Number 1, 10, 100, 1000, etc and display unit, ten, hundred,...

read -p "Enter number like 1, 10, 100 .. :" input_value
input_value_in_word="None"
if [ $input_value -eq 1 ]
then
    input_value_in_word="Unit"
elif [ $input_value -eq 10 ]
then
    input_value_in_word="Ten"
elif [ $input_value -eq 100 ]
then
    input_value_in_word="Hundred"
elif [ $input_value -eq 1000 ]
then
    input_value_in_word="Thousand" 
else
    input_value_in_word="Wrong Input"
fi

echo $input_value_in_word

#====================================================

# 4. Enter 3 Numbers do following arithmetic operation and find the one that
# is maximum and minimum
read -p "Enter 3 numbers with space : " a b c

exp_1=$(( a+b*c )) # exp_1 stands for expression_1
exp_2=$(( a%b+c ))
exp_3=$(( c+a/b ))
exp_4=$(( a*b+c ))

max_value=0
min_value=0

#finding max
if [[ $exp_1 -gt $exp_2 && $exp_1 -gt $exp_3 && $exp_1 -gt $exp_4 ]]
then
    max_value=$exp_1
fi
if [[ $exp_2 -gt $exp_1 && $exp_2 -gt $exp_3 && e$xp_2 -gt $exp_4 ]]
then
    max_value=$exp_2
fi
if [[ $exp_3 -gt $exp_1 && $exp_3 -gt $exp_2 && $exp_3 -gt $exp_4 ]]
then
    max_value=$exp_3  
fi 
if [[ $exp_4 -gt $exp_1 && $exp_4 -gt $exp_2 && $exp_4 -gt $exp_3 ]]
then
    max_value=$exp_4 
fi 


#finding minimum
if [[ $exp_1 -lt $exp_2 && $exp_1 -lt $exp_3 && $exp_1 -lt $exp_4 ]]
then
    min_value=$exp_1
fi
if [[ $exp_2 -lt $exp_1 && $exp_2 -lt $exp_3 && e$xp_2 -lt $exp_4 ]]
then
    min_value=$exp_2
fi
if [[ $exp_3 -lt $exp_1 && $exp_3 -lt $exp_2 && $exp_3 -lt $exp_4 ]]
then
    min_value=$exp_3  
fi 
if [[ $exp_4 -lt $exp_1 && $exp_4 -lt $exp_2 && $exp_4 -lt $exp_3 ]]
then
    min_value=$exp_4 
fi 

echo "Maximum value = $max_value"
echo "Minimum value = $min_value"

#====================================================================
#====================================================================



# Selection Practice Problems with case statement

# 1. Read a single digit number and write the number in word using Case
read -p "Enter a value between 0 to 9 : " single_digit_number
number_in_word="None"

case $single_digit_number in
                           0) number_in_word="Zero";;
                           1) number_in_word="One";;
                           2) number_in_word="Two";;
                           3) number_in_word="Three";;
                           4) number_in_word="Four";;
                           5) number_in_word="Five";;
                           6) number_in_word="Six";;
                           7) number_in_word="Seven";;
                           8) number_in_word="Eight";;
                           9) number_in_word="Nine";;
                           *) number_in_word="Wrong input";;

esac
echo "You entered $number_in_word"

#=====================================================

# 2. Read a Number and Display the week day (Sunday, Monday,...)

read -p "Enter Day Number from 1 to 7 : "  day_of_week
day="None"

case $day_of_week in
                   1) day="Monday";;
                   2) day="Tuesday";;
                   3) day="Wednesday";;
                   4) day="Thursday";;
                   5) day="Friday";;
                   6) day="Saterday";;
                   7) day="Sunday";;
                   *) day="Wrong input";;
esac

echo "You entered $day"

#==============================================

# 3. Read a Number 1, 10, 100, 1000, etc and display unit, ten, hundred,...

read -p "Enter number like 1, 10, 100 .. :" user_input
user_input_in_word="None"

case $user_input in
                   1) user_input_in_word="Unit";;
                   10) user_input_in_word="Ten";;
                   100) user_input_in_word="Hundred";;
                   1000) user_input_in_word="Thousand";;
                   *) user_input_in_word="Wrong input";;
esac

echo "You entered $user_input_in_word"

#===================================================

# 4. Write a program that takes User Inputs and does Unit Conversion of
#    different Length units

echo "Choose the conversion factor (Enter the number) "
echo "1. Feet to Inch "
echo "2. Feet to Meter "
echo "3. Inch to Feet "
echo "4. Meter to Feet "
read -p "Choose the option: " option
result="None"

case $option in
            1) read -p "Enter the value in feet: " parameter
               result="$parameter feet = $(( $parameter*12 )) inch" ;; # 1 foot = 12 inch

            2) read -p "Enter the value in feet: " parameter
               result="$parameter feet = `awk 'BEGIN{printf "%.4f", ( '$parameter' * 0.3048 ) }'` meter";; # 1 foot = 0.3048 meter
    
            3) read -p "Enter the value in Inch: " parameter
               result="$parameter inch = `awk 'BEGIN{printf "%.2f", ( '$parameter' / 12 ) }'` feet ";; # 12 inch = 1 foot

            4) read -p "Enter the value in meter: " parameter
               result="$parameter meter = `awk 'BEGIN{printf "%.2f", ( '$parameter' * 3.281 ) }'` feet ";; # 1 meter = 3.281 feet (approx)
               
            *) result="Wrong input";;
esac

echo $result
