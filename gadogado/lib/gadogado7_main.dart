import 'dart:io';
import 'package:gadogado/gadogado7.dart';

void main() {
  print('==================');
  print('  CREATE VEHICLE  ');
  print('==================');
  print('1. Bike');
  print('2. Car');

  print('Pilihan : ');
  String answer = stdin.readLineSync()!;

  Vehicle? vehicle;

  switch (answer) {
    case '1':
      print('========');
      print('  BIKE  ');
      print('========');
      
      stdout.write('Masukkan nama sepeda: ');
      String bikeName = stdin.readLineSync()!;
      stdout.write('Masukkan kecepatan sepeda: ');
      double bikeSpeed = double.parse(stdin.readLineSync()!);
      vehicle = bike(bikeName, bikeSpeed);
      break;

    case '2':
      print('========');
      print('  CAR   ');
      print('========');
      
      stdout.write('Masukkan nama mobil: ');
      String carName = stdin.readLineSync()!;
      stdout.write('Masukkan kecepatan mobil: ');
      double carSpeed = double.parse(stdin.readLineSync()!);
      vehicle = car(carName, carSpeed);
      break;

    default:
      print('Pilihan tidak valid!');
      return; 
  }

  print('Nama Kendaraan: ${vehicle.name}');
  print('Kecepatan Kendaraan: ${vehicle.speed}');
  vehicle.move();
}