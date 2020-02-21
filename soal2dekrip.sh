#!/bin/bash

for nama in $*
do
namaawal=`basename $nama .txt`
decrypt=`date +%H -r $nama`
hasildecrypt=`expr 26 - $decrypt`
namabaru=`echo $namaawal | caesar $hasildecrypt`
mv $nama $namabaru.txt
done
