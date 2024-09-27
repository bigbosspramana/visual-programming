import 'dart:io';

void main () {
  print("=======================");
  print(" CELCIUS -> FAHRENHEIT ");
  print("=======================");

  print("Masukkan Celcius : ");
  int? celcius = int.parse(stdin.readLineSync()!);

  double conversi = 9/5 * celcius + 32;

  print("=======");
  print(" HASIL ");
  print("=======");

  print ('Conversion from celcius to fahrenheit  : ${conversi.round()}');
}