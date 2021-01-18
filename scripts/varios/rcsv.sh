#!/bin/bash
input="/home/pakin/Documents/desarrolloWeb/PakinV3o2/Chispazo.csv"
# Set "," as the field separator using $IFS 
# and read line by line using while read combo 
while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7
do 
  echo "$f1 $f2 $f3 $f4 $f5 $f6 $f7"
done < "$input"
