#!/bin/bash
totalfile=`ls | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ $totalfile =~ [:digit:] ]]
then
	$totalfile = 0
fi

b=`expr $totalfile + 1`
c=`expr $totalfile + 28`

for((a=b;a<=c;a++))
do
wget "https://loremflickr.com/320/240/cat" -a wget.log -O pdkt_kusuma_$a
done

grep "Location" wget.log >> location.log
