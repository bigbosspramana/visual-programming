import 'dart:io';

void main () {
  print("================");
  print(" LUAS LINGKARAN ");
  print("================");

  double phi = 3.14;

  print("Masukkan Diameter : ");
  int? diameter = int.parse(stdin.readLineSync()!);

  double luas = 1/4 * diameter * phi;

  print("=======");
  print(" HASIL ");
  print("=======");

  print ('Luas Lingkaran : $luas');
}