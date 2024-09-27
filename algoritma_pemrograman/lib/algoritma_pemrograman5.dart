import 'dart:io';

void main () {
  print("==============");
  print(" BAYAR PARKIR ");
  print("==============");

  int tarif1 = 2000;
  int tarif2 = 1000;
  int jumlahBiaya = 0;
   
  print("Masukkan Jumlah Jam : ");
  int? jam = int.parse(stdin.readLineSync()!);

  print("==============");
  print(" BIAYA PARKIR ");
  print("==============");

  print('Jumlah Biaya Parkir : Rp.${jumlahBiaya + (jam <= 2 ? jam * tarif1 : jam * tarif2 )}');
}