#! /bin/bash 

#Get user info and change ownership

for userid in `cat passwd.txt | awk -F '::' '{print $1}'| awk -F ':' ' $NF > 1000 {print $NF}'`
do
  home_dir=`cat passwd.txt | grep $userid | uniq -u|awk -F '::' '{print $2}'| awk -F ':' '{print $1}'`
  user=`cat passwd.txt | grep $userid | uniq -u | awk -F ':' '{print $1}'`
  chown -R $user $home_dir
done

#==============================================



# Move file from one folder to respective folder

    touch abc.txt def.txt ghi.txt jkl.txt
    ls *.txt
    for file in `ls *.txt`
    do
      base_name=`echo $file | awk -F. '{print $1}'`
      mkdir $base_name
      mv $file $base_name
    done  


#==========================================================

# Append current date to all log files name which has extention
# .log.1 from a folder

    touch abc.log.1 def.log.1 ghi.log.1 jkl.log.1
    ls *.log.1
    for log_file in `ls *.log.1`
    do
      log_file_basename=`echo $log_file | awk -F. '{print $1}'`
      DATE +%d%m%Y
      mv $log_file "$log_file_basename-`DATE +%d%m%Y`.log"
    done


#==========================================================



# Check if a folder is exists or not if not then create it

  flag=`find . -type d -name 'abc'`
  if [ $flag ]
  then
      echo "folder is already exists "
  else
      mkdir abc    
  fi



#========================================================

# execute command hello and ls and check the execution status

executionStatus(){       # this fuction returns the execution status
  
  status_code=`echo $?`
  echo $status_code
  if [ $status_code -eq 0 ]
  then
      echo "Execution successfull"
  else
      echo "Unsucessfull execution"
  fi
}

execution(){
 hello
 executionStatus # this fuction returns the execution status
 ls
 executionStatus 
}

execution

#==========================================

# Set environment variable usersecret='dH34xJaa23' if its already not set

  if [ `env | grep usersecret` ]  #checks usersecret is already present or not
  then
     echo "Error"                 #usersecret is already present
  else
     export usersecret='dH34xJaa23'  #exporting usersecret
  fi   



#==========================================



# Find word "systemd" in all log files and count the number of occurence against all files


    for file in `ls /var/log/*.log`
    do
     word_count=`grep -o -i 'systemd' $file | wc -l`
     if [ $word_count -gt 0 ]
     then
         echo $file $word_count
     fi
    done

#=================================================



# process list table

  ps | awk '{print $1"   "$2"   "$8}'  #$1=PID $2=PPID $8=CMD


#=================================================





# print last 4 url counts in sorted order

cat access.log |  awk -F 'http' '{print "http"$2}' |  awk -F '"' '{print $1}' | sort | uniq -c | tail -4

#=============================




# Print list of 4 frequently access unique urls at particular hours

cat access.log |  grep '25/Sep/2019:05' | awk -F 'http' '{print "http"$2 }' | awk -F '"' '{print $1}' | sort | uniq -c | sort -r | tail -4

# I took a random time

# ===========================================


# Print list of web response code count in a unique sorted order 
cat access.log |  grep '10/Oct/2019:11' | awk -F ' ' '{print $9}' | sort | uniq -c | head -4


#====================================================





# print list of 10 unique sorted client ip


  cat access.log | awk '{print $NF}' | sort | uniq -c | sort -r | head -10


#===============================================================================








# Data Analysis

#(i) 

cat data.csv | awk '$4 > 10000 {print $0}' | awk '{print $2"        "$7}'
#============================



#(ii)
cat data.csv | grep -i captain | awk '{sum+=$7} END {print sum}'

#========================




#(iii)

cat data.csv | awk '$5 > 7000 && $5 < 10000 {print $0}'| awk '{print $3"      "$5}'

#===============================




#(iv)

cat data.csv | awk '{sum+=$4} END{ print sum/NR}'

#===============================================================



# Find difference between original file and updated file. Apply changes to the original file


mkdir  original updated                          # making directories 

cp original-file.sh original/                    # copying given file

cp updated-file.sh updated/                      # copying given file

diff -N original/ updated/                       # finding difference b/w those folders

cp -r original/ original-backup/                 # making copy of original folder as original-backup

cat >> original/original-file.sh                 # runing cat command to make some changes

diff -N updated/ original-backup/                # varifying updated and original-backup difference




