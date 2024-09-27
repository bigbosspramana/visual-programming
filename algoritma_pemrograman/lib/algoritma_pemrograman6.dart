import 'dart:io';

void main () {
  print("===============");
  print(" GAJI KARYAWAN ");
  print("===============");

  int gaji = 4000000;
  int bonus = 200000;
  int gajiTotal = 0;
   
  print("Masukkan Jumlah Jam Kerja : ");
  int? jam = int.parse(stdin.readLineSync()!);

  print('Gaji Karyawan : Rp.${gajiTotal + (jam < 40 ? gaji : gaji + bonus)}');
}