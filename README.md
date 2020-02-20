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

Penjelasan : 

Pada line pertama merupakan code standart untuk bash. Line berikutnya menampilkan tulisan "Region yang memiliki profit paling sedikit".
```
poina=`awk -F "," 'FNR>1{(seen[$13]+=$NF)}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -n | awk 'FNR<2{print $1}'`
echo "$poina"
```
Code di atas adalah code untuk menampilkan region yang memiliki profit paling sedikit. -F untuk field separator dimana disini kita gunakan comma sebagai field separator nya. FNR>1 supaya line mulai dari line kedua karena line pertama berisi penjelasan data seperti Row ID tidak diperlukan sehingga di sekip saja. Berikutnya kita gunakan command seen[$13] dimana berfungsi untuk melihat pada kolom 13 yang berisi region dan menambahkan data $NF(kolom terakhir). Kenapa kita menggunakan $NF karena pertama ketika menggunakan $21(profit) ada beberapa bagian yang menampilkan profit "0" dan setelah saya lakukan pengecekan ternyata dalam kolom nama barang terdapat nama barang yang terdapat comma di dalamnya.

Contoh pada line ke 3 csv
```
Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back
```
Sehingga oleh bash akan di anggap kolom nya bertambah 1 kolom jadi saya menggunakan $NF agar bisa mendapatkan hasil yang di inginkan. Line berikutnya merupakan loop untuk melakukan print dari hasil yang didapat. Setelah itu kita tuliskan nama file yang akan di eksekusi yaitu "Sample-Supersotre.csv". Lalu kita pipe agar bisa menjalankan beberapa perintah sekaligus dan diberikan perintah sort diikuti dengan parameter -n yang berarti Numeric Sort dan akan di urutkan dari yang terkecil menuju ke paling besar. Setelah perintah sort maka tinggal melakukan print. Disini, command yang digunakan adalah 
``` awk 'FNR<2{print $1}'```
dimana data yang akan di print adalah row yang kurang dari 2 dan print kolom pertama saja sehingga hasil yang di dapat adalah "Central"
