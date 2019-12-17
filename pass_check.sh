#!/bin/bash

# Add file and the target file size below
repo=rbf-brain

# file 1
file1=model.stl
target_file_size1=2090800

# file 2
file2=parameters.prm
target_file_size2=1780


# You shoud not have to modify below
#
 myfilesize1=$(wc -c <"$file1")
 echo Acutal File1 Size = "$myfilesize1"
 echo Target File1 Size = "$target_file_size1"
 
 myfilesize2=$(wc -c <"$file2")
 echo Acutal File2 Size = "$myfilesize2"
 echo Target File2 Size = "$target_file_size2"
 
 declare -i myint=0
 if [ $myfilesize1 -ge $target_file_size1 ];then
         declare -i myint=1
 else
         declare -i myint=0
 fi
 if [ $myfilesize2 -ge $target_file_size2 ];then
         declare -i myint=1
 else
         declare -i myint=0
 fi
 if [ $myint -ge 1 ];then
         echo Passed!
         echo "Passed" >> ~/$repo.PASSED
 else
        echo Failed!
         echo "Failed!" >> ~/$repo.FAILED
         echo "Acutal File1 Size = "$myfilesize1" " >> ~/$repo.FAILED
         echo "Target File1 Size = "$target_file_size1" " >> ~/$repo.FAILED
         echo "Acutal File2 Size = "$myfilesize2" " >> ~/$repo.FAILED
         echo "Target File2 Size = "$target_file_size2" " >> ~/$repo.FAILED
 fi
