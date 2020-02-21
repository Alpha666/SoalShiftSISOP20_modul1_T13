# Sistem Operasi
## Modul 1
## Tugas Sistem Operasi Modul 1

1. Menampilkan data profit terkecil dari masing masing region
2. Menampilkan 2 state yang memiliki keuntungan profit yang paling sedikit berdasarkan hasil nomor 1
3. Menampilkan 10 produk yang memiliki keuntungan paling sedikit berdasarkan hasil 2 negara nomor 2


# Soal 1

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
dimana data yang akan di print adalah row yang kurang dari 2 dan print kolom pertama saja sehingga hasil yang di dapat adalah ```Central```

Lanjut pada baris berikutnya kita hanya melakukan echo variabel di atasnya yaitu ```poina``` sehingga akan menampilkan tulisan ```Central``` ke layar. Setelah itu kita print break agar ada jarak antara soal pertama dan kedua.

Berikutnya kita print tulisan ```"2 negara bagian yang memiliki profit paling sedikit dari poin A"``` lalu kita letakkan code berikutnya yaitu 

```
poinb=`awk -F "," -v a=$poina 'FNR>1{if(a~$13)seen[$11]+=$NF}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -nk2 | awk 'FNR<2{print $1}' > susah.txt`
poinb2=`awk -F "," -v a=$poina 'FNR>1{if(a~$13)seen[$11]+=$NF}END{for(i in seen)print i, seen[i]}' Sample-Superstore.csv | sort -nk2 | awk 'NR==2{print $1}' > njir.txt
```

Kedua code ini sebenarnya sama jadi saya akan jelaskan yang atas saja.

pada variabel poinb kita lakukan input hasil dari variabel sebelumnya dengan cara menulis command ```-v``` dan kita masukkan logic ke awk dimana jika input dari variabel sebelumnya ada di kolom 13 maka lihat kolom 11 dimana terdapat state dan jumlahkan kolom terakhir dan lakukan print dari Sample-Superstore.csv. Setelah itu kita sort datanya secara numerikal dengan patokan dari kolom ke 2 sehingga menggunakan parameter -nk2 dan kita print row dibawah 2 dan kolom pertama lalu kita simpan ke dalam file ```susah.txt``` karena akan digunakan pada soal ke 3 dan awk tidak bisa membaca 2 input secara bersamaan jadi harus di pisah. Yang membedakan baris pertama dan kedua adalah pada saat print nya dimana pada baris kedua kita gunakan logic "==" karena kita hanya butuh print row ke 2 dan kolom ke 1 dan kita simpan dalam variabel ```njir.txt``` dan akan digunakan lagi berikutnya.

```varsusah=$(cat "susah.txt")``` 

Code di atas digunakan untuk mengambil data dari txt yang sudah di export dari awk sebelumnya.

```
poinc=`awk -F "," -v susah="$varsusah" 'FNR>1{if(susah~$11)seen[$NF]}END{for(i in seen)print i}' Sample-Superstore.csv | sort -n | awk 'NR==1,NR==10{print $1}' > apaini.txt `
poinc2=`awk -F "," -v njir="$varnjir" 'FNR>1{if(njir~$11)seen[$NF]}END{for(i in seen)print i}' Sample-Superstore.csv | sort -n | awk 'NR==1,NR==10{print $1}' > pusinggua.txt
```
Code di atas mengecek apakah pada kolom ke 11 ada tulisan yang sama dengan variabel yang sudah di ambil dari awk sebelumnya dan jika ada maka akan mengecek pada kolom terakhir(profit) dan melakukan print row profit 1-10

```
echo "10 barang dari negara bagian $varsusah"
varpusing=$(cat "apaini.txt")
hasilc=`awk -F "\"*,\"*" -v susah="$varsusah" 'FNR>1{if($11~susah)printf "%f %s\n",$21,$17}' Sample-Superstore.csv | sort -g| awk 'NR<11{print $0}'`
echo "$hasilc"

echo ""

echo "10 barang dari negara bagian $varnjir"
hasilc2=`awk -F "\"*,\"*" -v njir="$varnjir" 'FNR>1{if($11~njir)printf "%f %s\n",$21,$17}' Sample-Superstore.csv | sort -g | awk 'NR<11{print $0}'`
echo "$hasilc2"
```
disini hasil dari sorting pada awk sebelumnya akan di cocokan dengan row 11 (texas) maka akan melakukan print float kolom 21 dan juga kolom 17 (product name) dan disini comma nya di masukkan ke dalam command yang tidak akan di baca sehingga hasil profit tidak akan bergeser.

# Soal 2

1.Generate password 28 digit dan jadikan nama file
2.Enkripsi file dengan melihat jam pada saat pembuatan file poin1
3.Dekripsi hasil dari file 2

## Poin 1

```
#!/bin/bash
name=$*
pertama=`cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 28 | head -n 1` 
hapusangka=`printf '%s\n' "${name//[[:digit:]]/}"`
echo -e $pertama >> $hapusangka.txt
```
Pada poin pertama ini line pertama kita declare variabel nama yang akan menyimpan argumen yang di inputkan oleh user.
Lalu kita menggunakan fungsi dari linux dimana akan melakukan generate random password dengan parameter yang sudah kita set yaitu A-Z lalu a-z dan juga 0-9. Kita gunakan fungsi fold 28 dimana fungsi ini sendiri akan membuat kata yang digenerate sepanjang 28 kata lalu fungsi head 1 berfungsi untuk mengambil baris pertama dari fold.

Pada baris berikutnya adalah program untuk menghapus angka yang dimasukkan oleh user dan hanya menyisakan alphabet saja. Lalu berikutnya variabel pada line kedua akan disimpan ke dalam sebuah file txt dimana nama file tersebut diambil dari variabel pada baris ketiga yaitu hapus angka.

## Poin 2

```
#!/bin/bash

for nama in $*
do
namaawal=`basename $nama .txt`
encrypt=`date +%H -r $nama`
namabaru=`echo $namaawal | caesar $encrypt`
mv $nama $namabaru.txt
done
```

Pada poin kedua ini line pertama kita buat sebuah looping dimana akan menempatkan argumen yang ada pada variabel nama dan setelah itu akan melakukan pengambilan nama file dan menyimpan ke dalam variabel nama. Setelah itu pada variabel encrypt kita ambil jam menggunakan command date dari file nama tersebut. Setelah itu, kita buat variabel baru yang akan menampung nama baru yang telah di ecnrypt menggunakan caesar. Disini, menggunakan library karena lebih menghemat waktu. Lalu, merename file lama dengan file baru.

## Poin 3

```
#!/bin/bash

for nama in $*
do
namaawal=`basename $nama .txt`
decrypt=`date +%H -r $nama`
hasildecrypt=`expr 26 - $decrypt`
namabaru=`echo $namaawal | caesar $hasildecrypt`
mv $nama $namabaru.txt
done
```
Pada poin ketiga ini sama saja dengan poin kedua dan hanya di balik fungsi nya. Namun, yang membedakan adalah pada variabel decrypt dimana 26 (jumlah alphabet) di kurangi jumlah jam yang didapat dari jam pembuatan file enkripsi. Setelah itu kita simpan dengan nama baru dimana nama awal akan di decrypt lalu kita rename nama yang ada pada file dengan nama baru yang di dapat setelah hasil decrypt.
