#! /bin/bash -x

# 1. Write a program in the following steps
#    a. Roll a die and find the number between 1 to 6
#    b. Repeat the Die roll and find the result each time
#    c. Store the result in a dictionary
#    d. Repeat till any one of the number has reached 10 times
#    e. Find the number that reached maximum times and the one that was for minimum times


rullingDice(){
    
    declare -i resultDict
    local valid=1                                                                             

    while [ $valid ]
    do

        local diceNumber=$(( RANDOM%6 +1 ))                              # Rolling the dice 
        
        echo "Dice Number : " $diceNumber                                # Prinnting the dice number

        flag=0                                                           # flag is used to check if the key is present in the dict or not
        for key in ${!resultDict[@]}                                     # Looping through all the keys in the dict to find a match with dicenumber
        do   
           
            if [ $diceNumber -eq $key ]
            then

                resultDict[$key]=$(( resultDict[$key]+1 ))               # once match found with the key, value is updated and break out of the for loop      
                flag=1
                break

            fi
        done
        
        if [ $flag -eq 0 ]                                               # intitial case, if the key is not present in dict, set its value 1
        then
           resultDict[$diceNumber]=1
        fi


      for key in ${!resultDict[@]}                                      # Looping through all the keys to satisfy the base condition
      do

        if [ ${resultDict[$key]} -ge 10 ]                               # This is the base condition 
        then
            valid=0   
        fi
      done

      if [ $valid -eq 0 ]                                               # when base condition satisfied we break out of while loop
      then
           break
      fi    
    done
   



#   Finding the mumber that occurs maximum


   local maxValue=0
   local maxKey=0
   for key in ${!resultDict[@]}
   do
     if [ ${resultDict[$key]} -gt $maxValue ]
     then
         maxValue=${resultDict[$key]}
         maxKey=$key
     fi
   done
   echo "Maximum occurence number  :" $maxKey




#   Finding the mumber that occurs minimum


   local minValue=100
   local minKey=0
   for key in ${!resultDict[@]}
   do
     if [ ${resultDict[$key]} -lt $minValue ]
     then
         minValue=${resultDict[$key]}
         minKey=$key
     fi
   done
   echo "Minimum occurence number  :" $minKey   


}

rullingDice





#===================================================================================






# 2. Write a Program to generate a birth month of 50 individuals between the
#    year 92 & 93. Find all the individuals having birthdays in the same month.
#    Store it to finally print.


sameBirthMonth(){

    declare -i birthMonthsDict
    
    local count=1
    
    while [ $count -le 50 ]
    do
        birthMonth=$(( RANDOM%12 + 1 ))                                             # Generating Birth Months 
        
        flag=0                                                                      # flag is used to check if key is present in dict or not

        for key in ${!birthMonthsDict[@]}
        do
          if [ $key -eq $birthMonth ]
          then
             birthMonthsDict[$key]=$(( birthMonthsDict[$key] + 1 ))
             flag=1
             break
          fi
        done
        
        if [ $flag -eq 0 ]                                                          # if key is not present, set its value to 1
        then
            birthMonthsDict[$birthMonth]=1
        fi

        ((count++))

    done
    

   # monthArray is used to map the months with dict keys. 0th positon is skipped to map the key from 1 to 12

   local monthArray=("Month" "Jan" "Fab" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")   

   for key in ${!birthMonthsDict[@]}
   do
       echo ${monthArray[$key]} " : " ${birthMonthsDict[$key]} " people have birthday"                                                                         
   done
    
}

sameBirthMonth
