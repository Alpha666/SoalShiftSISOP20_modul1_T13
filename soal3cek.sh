#!/bin/bash
totalfile=`ls | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`
if [[ `ls | grep "kenangan"` != "kenangan" ]]
then 
	mkdir ./kenangan
fi
if [[ `ls | grep "duplicate"` != "duplicate" ]]
then
	mkdir ./duplicate
fi
for((satu=1;satu<=totalfile;satu++)) 
do
	for((dua=1;dua<=totalfile;dua++))
	do 
	pertama=`md5sum pdkt_kusuma_$satu pdkt_kusuma_$dua | awk '{if(NR==1)print $0}'`
	kedua=`md5sum pdkt_kusuma_$satu pdkt_kusuma_$dua | awk '{if(NR==2)print $0}'`
	if [[ $satu -ne $dua && $pertama == $kedua ]]
	then
		mv pdkt_kusuma_$dua ./duplicate/duplicate_$dua
	fi
	done 
done
for((terakhir=1;terakhir<=totalfile;terakhir++))
do
mv pdkt_kusuma_$terakhir ./kenangan/kenangan_$terakhir
done
cat wget.log >> wget.log.bak
rm wget.log
