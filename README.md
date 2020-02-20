# Sistem Operasi
## Modul 1
## Tugas Sistem Operasi Modul 1

1. Menampilkan data profit terkecil dari masing masing region
2. Menampilkan 2 state yang memiliki keuntungan profit yang paling sedikit berdasarkan hasil nomor 1
3. Menampilkan 10 produk yang memiliki keuntungan paling sedikit berdasarkan hasil 2 negara nomor 2

Code : 

```#!/bin/bash

echo "Region yang memiliki profit paling sedikit : "
poina=`awk -F "," 'FNR>1{(seen[$13]+=$NF)}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -n | awk 'FNR<2{print $1}'`
echo "$poina"
echo ""
echo "2 negara bagian yang memiliki profit paling sedikit dari poin A "
poinb=`awk -F "," -v a=$poina 'FNR>1{if(a~$13)seen[$11]+=$NF}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -nk2 | awk 'FNR<2{print $1}' > susah.txt`
poinb2=`awk -F "," -v a=$poina 'FNR>1{if(a~$13)seen[$11]+=$NF}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -nk2 | awk 'NR==2{print $1}' > njir.txt`
cat "susah.txt"
varsusah=$(cat "susah.txt")
cat "njir.txt"
varnjir=$(cat "njir.txt")
echo ""
poinc=`awk -F "," -v susah="$varsusah" 'FNR>1{if(susah~$11)seen[$NF]}END{for(i in seen)print i}' Sample-Superstore.csv | sort -n | awk 'NR==1,NR==10{print $1}' > apaini.txt `
poinc2=`awk -F "," -v njir="$varnjir" 'FNR>1{if(njir~$11)seen[$NF]}END{for(i in seen)print i}' Sample-Superstore.csv | sort -n | awk 'NR==1,NR==10{print $1}' > pusinggua.txt `


echo "10 barang dari negara bagian $varsusah"
varpusing=$(cat "apaini.txt")
hasilc=`awk -F "\"*,\"*" -v susah="$varsusah" 'FNR>1{if($11~susah)printf "%f %s\n",$21,$17}' Sample-Superstore.csv | sort -g| awk 'NR<11{print $0}'`
echo "$hasilc"

echo ""

echo "10 barang dari negara bagian $varnjir"
hasilc2=`awk -F "\"*,\"*" -v njir="$varnjir" 'FNR>1{if($11~njir)printf "%f %s\n",$21,$17}' Sample-Superstore.csv | sort -g | awk 'NR<11{print $0}'`
echo "$hasilc2"
```
