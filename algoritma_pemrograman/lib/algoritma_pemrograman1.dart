import 'dart:io';
void main () {
  int hargaJeruk = 4000;
  int hargaApel = 5000;

  print("================");
  print(" PEMBELIAN BUAH ");
  print("================");
  print("Masukkan Berapa (Kg) Apel : ");
  double? apel = double.parse(stdin.readLineSync()!);
  print("Masukkan Berapa (Kg) Jeruk : ");
  double? jeruk = double.parse(stdin.readLineSync()!);

  double totalHargaApel = hargaApel * apel;
  double totalHargaJeruk = hargaJeruk * jeruk;

  print('Total Harga Apel : ${totalHargaApel.round()}');
  print('Total Harga Jeruk : ${totalHargaJeruk.round()}');
  
  double jumlahHarga = totalHargaJeruk + totalHargaApel;

  print ('Total Harga yang harus dibayar : Rp.${jumlahHarga.round()}');
}