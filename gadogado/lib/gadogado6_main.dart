import 'dart:io';
import 'package:gadogado/gadogado6.dart';

void main() {
  print('==================');
  print('    SUHU KELVIN   ');
  print('==================');
  stdout.write("Masukkan suhu Celcius : ");
  double? celcius = double.parse(stdin.readLineSync()!);

  print('===================');
  print('   KONVERSI SUHU   ');
  print('===================');
  print("Pilih skala suhu yang ingin Anda konversi:");
  print("1. Reaumur");
  print("2. Fahrenheit");
  print("3. Kelvin");

  // Menerima pilihan dari pengguna
  stdout.write("Pilihan : ");
  String? choice = stdin.readLineSync();

  // Melakukan konversi berdasarkan pilihan pengguna
  switch (choice) {
    case '1':
      reaumur(celcius);
      break;
    case '2':
      fahrenheit(celcius);
      break;
    case '3':
      kelvin(celcius);
      break;
    default:
      print("Pilihan yang Anda masukkan TIDAK VALID.");
      break;
  }
}
