#!/bin/bash

for nama in $*
do
namaawal=`basename $nama .txt`
encrypt=`date +%H -r $nama`
namabaru=`echo $namaawal | caesar $encrypt`
mv $nama $namabaru.txt
done
