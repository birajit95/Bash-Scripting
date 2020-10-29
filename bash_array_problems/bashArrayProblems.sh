#! /bin/bash -x

# 1. Write a program in the following steps
#  a. Generates 10 Random 3 Digit number.
#  b. Store this random numbers into a array.
#  c. Then find the 2nd largest and the 2nd smallest element without sorting the array.


findSecondLargest(){

    ar=$@                                                                      # fetching all values of arrray into ar
    firstMax=0
    secondMax=0

    for item in ${ar[@]}
    do
      if [ $item -gt $firstMax ]
      then
         secondMax=$firstMax
         firstMax=$item
      elif [[ $item -gt $secondMax && $item -ne $firstMax ]]
      then
          secondMax=$item   
      fi
    done

    echo "second largest "$secondMax
}

findSecondSmallest(){

    local ar=$@                                                                   # fetching all values of arrray into ar

    firstMin=1000
    secondMin=1000

    for item in ${ar[@]}
    do
      if [ $item -lt $firstMin ]
      then
      
         secondMin=$firstMin
         firstMin=$item

      elif [[ $item -lt $secondMin && $item -ne $firstMin ]]
      then
          secondMin=$item   
      fi 
    done

    echo "Second smallest "$secondMin
}


randomArray(){                                                                       # main function
    
    declare -a arr                                                                   # declaring array

    for i in {1..10}
    do
        local randomNumber=$(( RANDOM%900 + 100 ))                                   # range 0+100 to 899+100

        arr[$i]=$randomNumber

    done

    echo ${arr[@]}

    findSecondLargest ${arr[@]}                                                      # passing array as argument in the function

    findSecondSmallest ${arr[@]}                                                     # passing array as argument in the function

}

randomArray                                                                          # program execution starts from here


#======================================================================









# 2. Extend the above program to sort the array and then find the 2nd largest
#    and the 2nd smallest element.

sortArray(){

    local sortedArray=()
    local count=0

    for itm in $@
    do
      sortedArray[((count++))]=$itm
    done

    for (( i = 0; i<10; i++ ))                                                                   # Buble sort is used to sort the array
    do  
      for (( j = 0; j<10-i-1; j++ )) 
      do
        if [ ${sortedArray[j]} -gt ${sortedArray[$(( j+1 ))]} ]
        then
            temp=${sortedArray[j]} 
            sortedArray[$j]=${sortedArray[$(( j+1 ))]}   
            sortedArray[$(( j+1 ))]=$temp
        fi
      done
    done
    echo ${sortedArray[@]}
}


findSecondMax(){

    local sortedArray=()
    local count=0
    
    for arrItem in $@
    do
       sortedArray[((count++))]=$arrItem
    done

    local length=${#sortedArray[@]}

    echo "Second Max "${sortedArray[$(( length-2 ))]}
}


findSecondMin(){
    local sortedArray=()
    local count=0
    for arrayItem in $@
    do
       sortedArray[((count++))]=$arrayItem
    done

    local length=${#sortedArray[@]}
    
    echo "Second Min "${sortedArray[1]}
}


randomArray2(){                                                                   # main function 
    
    declare -a array                                                              # declaring array

    for i in {1..10}
    do
        local randomNumber=$(( RANDOM%900 + 100 ))                               # range 0+100 to 899+100

        array[$i]=$randomNumber                                 

    done
    
    local sortedArray=$( sortArray ${array[@]} )                                 # calling sortArray function to return sorted array

    findSecondMax ${sortedArray[@]}                                              # calling findSecondMax function with passing sorted array

    findSecondMin ${sortedArray[@]}                                              # calling findSecondMin function with passing sorted array
}

randomArray2                                                                     # program execution starts from here






#=============================================================================================








# 3. Extend the Prime Factorization Program to store all the Prime Factors of a
#    number n into an array and finally display the output.



isPrime(){                                               

    local item=$1
    local x=2
    while [ $x -lt $item ]
    do
        if [ $(( item%x )) -eq 0 ]
        then
            break
        fi
        ((x++))
    done

    if [ $x -eq $item ]
    then
        echo 1
    else
        echo 0
    fi    
}


isPrimeFactor(){

    local i=$1
    local n=$2

    if [ $(( n%i )) -eq 0 ]                                                       # This condition is checking factor or not
    then
        if [ $( isPrime $i ) -eq 1 ]                                               # This condition is checking if the factor is prime or not
        then
            echo 1
        else
            echo 0
        fi
    else
        echo 0   
    fi
}



primeFactorization(){                                                        # Main Function
    
    read -p "Enter a number : " n
    
    local primeFactorList=()
    local count=0

    for (( i=1; i<=n/2+ 1 ; i++ ))
    do
       if [ $( isPrimeFactor $i $n ) -eq 1 ]                                   # checking i is prime factor or not ( passing 2 args i and n )
       then
          primeFactorList[((count++))]=$i
       fi
    done

    echo "List of prime factors of "$n " are " ${primeFactorList[@]}

}       

primeFactorization



#======================================================================






# 4. Write a Program to show Sum of three Integer adds to ZERO

sumOfThreeNumber(){

    local array=(-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7)                                         # taking any random array
    local n=${#array[@]}

    
    for (( i=0; i<n-2; i++ ))
    do
       for (( j=i+1; j<n-1; j++ ))
       do
          for (( k=j+1; k<n; k++ ))
          do
           
           local sum=$(( ${array[i]} + ${array[j]} + ${array[k]} ))

           if [ $sum -eq 0 ]
           then
              echo "( ${array[i]}  ${array[j]}  ${array[k]} ) => 0"
           fi

          done
       done
    done

}

sumOfThreeNumber


#========================================================




# 5. Take a range from 0 – 100, find the digits that are repeated twice like 33, 77,
#    etc and store them in an array


findRepeatedDigit(){

    local repeatedDigitList=()
    local count=0
    for i in {1..100}
    do
      if [ $(( i%11 )) -eq 0 ]
      then
          repeatedDigitList[((count++))]=$i
      fi
    done

    echo ${repeatedDigitList[@]}
}

findRepeatedDigit




             #===================================================================================
             #=========================================== Done ==================================

