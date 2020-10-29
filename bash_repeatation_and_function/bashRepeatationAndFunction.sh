#! /bin/bash 

# Problems with while loops
#===============================

# 1. Write a program that takes a command-line argument n and prints a table of the
#    powers of 2 that are less than or equal to 2^n.


    n=$1
    power=1
    valid=true
    while [ $power -le $n ]
    do
       result=$(( 2**power ))
       echo "2^"$power "=" $result
       (( power++ ))
    done

#==============================================

# 2. Write a program that takes a command-line argument n and prints the nth harmonic
#    number

  
  n=$1
  term_number=1
  nth_harmonic_no=0
  while [ $term_number -le $n ]
  do
     fraction=`awk 'BEGIN{printf "%.2f", ( 1/'$term_number' ) }'`                       # fraction = 1/term_number
     nth_harmonic_no=`awk 'BEGIN{printf "%.2f", ( '$nth_harmonic_no'+'$fraction' ) }'`  # nth_harmoonic_no += fraction
     ((term_number++))
  done

  echo $nth_harmonic_no
   

#=========================================

# 3. Write a program that takes a input and determines if the number is a prime.


   read -p 'Enter a number : ' n
   i=2
   while [ $i -lt $n ]
   do
      if [ $(( n%i )) -ne 0 ]
      then
          (( i++ ))
      else
          break
      fi
   done

   if [ $i -eq $n ]
   then
       echo $n" is prime number"
   else
       echo $n" is Not a prime number"
   fi        

#=============================================

# 4. Extend the program to take a range of number as input and output the Prime
#    Numbers in that range.



    number_list=(2 3 4 5 6 7 8 9 10 11 12)
    list_length=${#number_list[@]}

    index=0
    while [ $index -lt $list_length ]
    do
        n=${number_list[$index]}

        i=2
        while [ $i -lt $n ]
        do
          if [ $(( n%i )) -ne 0 ]
          then
             (( i++ ))
          else
              break
          fi
        done

        if [ $i -eq $n ]
        then
            echo $n" prime number"
        else
            echo $n" Not a prime number"
        fi

       ((index++))
    done


#================================================

# 5. Write a program that computes a factorial of a number taken as input.

    read -p "Enter a number whose factorial you want: " num
    
    factorial=1
    
    iter=2
    while [ $iter -le $num ]
    do
       factorial=$(( factorial*iter ))
       (( iter++ ))
    done
    echo $factorial
    



#===============================================

# 6. Write a program to compute Factors of a number N using prime factorization method.
#    Logic -> Traverse till i*i <= N instead of i <= N for efficiency.
#    O/P -> Print the prime factors of number N.


    read -p "Enter the number whose prime factors you want: " fact_num

    i=1
    while [ $i -le $fact_num ]             # here i have used i<=N instead of i*i<=N, cause for i*i<=N, it jumps many steps 
    do                                     # for that many prime factors are being skipped 
        if [ $(( fact_num%i )) -eq 0 ]
        then
               
         n=$i
         j=2
         while [ $j -lt $n ]
         do
           if [ $(( n%j )) -ne 0 ]
           then
               (( j++ ))
           else
               break
           fi
          done

          if [ $j -eq $n ]
          then
             echo $n" is prime Factor of $fact_num"
          fi 
        fi
         ((i++))
    done


#================================================


#    ===================  2nd part  =========================

# 1. Write a program that takes a command-line argument n and prints a
#    table of the powers of 2 that are less than or equal to 2^n till 256 is reached..

    n=$1
    power=0
    while [ $power -le $n ]
    do
       table_result=$(( 2**power ))
       echo "2^"$power "=" $table_result

       (( power++ ))

       if [ $table_result -ge 256 ]
       then
           break
       fi

    done


#=============================================

# 2. Find the Magic Number


  
  n=100
  read -p "Enter any number between 1 to 100 :" num

  lower_bound=0
  upper_bound=$n

  while [ $lower_bound -le $upper_bound ]
  do
      mid=$(( ( lower_bound + upper_bound )/2 ))

      if [ $num -gt $mid ]
      then
          lower_bound=$(( mid+1 ))
      elif [ $num -lt $mid ]
      then
          upper_bound=$(( mid-1 )) 
      else
          echo $num "found at" $mid"th location"
          break       
      fi
  done


#==================================



# 3 Extend the Flip Coin problem till either Heads or Tails wins 11 times.


    count_head=0
    count_tail=0
    while [[ $count_head -lt 11 || $count_tail -lt 11 ]]
    do  
         coin_status=$(( RANDOM%2 ))
         if [ $coin_status -eq 1 ]
         then
             ((count_head++))
         else
             ((count_tail++))    
         fi

    done

    if [ $count_head -eq 11 ]
    then
        
        echo "Head wins"
    else
        
        echo "Tail wins"
    fi        


#=====================================

# 4. Write a Program where a gambler starts with Rs 100 and places Re 1 bet
#   until he/she goes broke i.e. no more money to gamble or reaches the
#   goal of Rs 200. Keeps track of number of times won and number of bets
#   made.


    
    INITIAL_MONEY=100
    BET_RATE=1
    GOAL_MONEY=200
    bet_count=0
    wining_count=0
    
    cur_money=$INITIAL_MONEY

    while [[ $cur_money -gt 0 && $cur_money -lt $GOAL_MONEY ]]
    do
       bet_status=$(( RANDOM%2 ))                                     # 1 is for wining and 0 is for losing

       if [ $bet_status -eq 1 ]
       then
           ((wining_count++))
            cur_money=$(( cur_money + BET_RATE ))

       else
            cur_money=$(( cur_money - BET_RATE ))
       fi

       ((bet_count++))

    done

    echo "Winnig times "$wining_count
    echo "Number of bet made" $bet_count


#======================================================

#================================ Function practice problems ===================================================

# 1. Help user find degF or degC based on their Conversion Selection. Use
#    Case Statement and ensure that the inputs are within the Freezing Point (
#    0 °C / 32 °F ) and the Boiling Point of Water ( 100 °C / 212 °F )

DegCToDegF(){

    read -p "Enter temparature between 0 degC to 100 degC :" degC
    while [[ $degC -lt 0 || $degC -gt 100 ]]
    do 
       read -p "Wrong input! Enter value again between 0 to 100 : " degC
    done

    degF=$(( ( degC*9/5  ) + 32 ))

    echo "$degC deg C = $degF deg F"
}

DegFToDegC(){

    read -p "Enter temparature between 32 degF to 212 degF :" degF
    while [[ $degF -lt 32 || $degF -gt 212 ]]
    do 
       read -p "Wrong input! Enter value again between 32 to 212 : " degF
    done

    degC=$(( ( degF-32 )*5/9 ))

    echo "$degF deg F = $degC deg C"
}

echo "Choose your conversion scale"
echo "1. Centegrade to Farenheit"
echo "2. Farenheit to Centegrade"

read -p "Your option : " option

case $option in
              1) DegCToDegF;;
              2) DegFToDegC;;
              *) echo "wrong Input";;
esac


#==================================================

# 2. Write a function to check if the two numbers are Palindromes

isPalindrome(){

    read -p 'enetr a number : ' num
    n=$num
    reverse=0
    while [ $n -gt 0 ]
    do
      r=$(( n%10 ))
      reverse=$(( ( reverse*10 )+r ))
      n=$(( n/10 ))
    done
    if [ $reverse -eq $num ]
    then
       echo $num " is a Palindrom "
    else
       echo $num " is not a Palindrom "
          
    fi

}

isPalindrome

#===================================================

# Take a number from user and check if the number is a Prime then show
#   that its palindrome is also prime
#   a. Write function check if number is Prime
#   b. Write function to get the Palindrome.
#   c. Check if the Palindrome number is also prime

isPrimeNumber(){
   n=$1
   i=2
   while [ $i -lt $n ]
   do
      if [ $(( n%i )) -ne 0 ]
      then
          (( i++ ))
      else
          break
      fi
   done

   if [ $i -eq $n ]
   then
       echo 1                      # returns 1 for prime number
   else
       echo 0                      # returns 0 for not being prime number
   fi        
}

isPalindromeNumber(){
    num=$1
    n=$num
    reverse=0
    while [ $n -gt 0 ]
    do
      r=$(( n%10 ))
      reverse=$(( ( reverse*10 )+r ))
      n=$(( n/10 ))
    done
    if [ $reverse -eq $num ]
    then
       echo $reverse                # returns reverse if palidrome
    else
       echo 0                       # returns 0 for not being palindrome
    fi
}


numberVarification(){

read -p "Enter a number to varify : " varNum

if [[ $( isPrimeNumber $varNum ) -eq 1 ]]                # checking prime or not 
then
    echo $varNum "is prime"
    echo "Checking its palindrome"

    palindrome=$( isPalindromeNumber $varNum )             # getting palindrom status
    
    if [[ $palindrome -gt 0 ]]                             # checking palindrom or not 
    then
        echo "$varNum is Palindrome also"
        echo "Checking if its prime or not"

        if [[ $( isPrimeNumber $palindrome ) -eq 1 ]]       # checking palindrome is prime or not
        then

            echo "Palindrome of $varNum is also a prime"

        else
            echo "Palindrome of $varNum is not a prime"    
        fi

    else
        echo $varNum "is not a palindrome"    
    fi

else
    echo $varNum " is not a prime number"
fi

}

numberVarification