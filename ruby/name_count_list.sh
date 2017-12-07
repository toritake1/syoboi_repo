#!/bin/sh

YEAR=$1
M_W=$2

for name in `cat $YEAR/$M_W.txt | awk -F, '{print $1}'`
do
   echo $name
   grep $name */*_cast_count.csv | awk -F/ '{print $1,$2}' | awk -F, '{print $1,$2}' \
   | awk 'BEGIN {OFS="\t"} {print $1,$3}'
done

echo "---------------------------------"

for name in `cat $YEAR/$M_W.txt | awk -F, '{print $1}'`
do
   echo $name
   grep $name */*_cast_count.csv | awk -F/ '{print $1,$2}' | awk -F, '{print $1,$2}' \
   | awk 'BEGIN {OFS="\t"} {print $3}'
   echo ""
done

