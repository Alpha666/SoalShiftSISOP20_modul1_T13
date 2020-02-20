#!/bin/bash
name=$*
pertama=`cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 28 | head -n 1` 
hapusangka=`printf '%s\n' "${name//[[:digit:]]/}"`
echo -e $pertama >> $hapusangka.txt

