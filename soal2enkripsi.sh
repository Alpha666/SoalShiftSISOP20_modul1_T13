#!/bin/bash

for nama in $*
do
namaawal=`basename $nama .txt`

a=`ls -i $nama`
encrypt=`date +%H -r $nama`
namabaru=`echo $namaawal | caesar $encrypt`
mv $nama $namabaru.txt
done
