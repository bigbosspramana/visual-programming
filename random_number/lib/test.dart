import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('How much number u want to generate: ');
  int? number = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];
  var i = 0;
  Random rng = Random();
  while (i++ < number) {
    int rdNum = rng.nextInt(100);
    numbers.add(rdNum);
  }
  print('Generated numbers: $numbers');

  print("====================");
  print(" CHOOSE NUMBERS 1-3 ");
  print("====================");
  print("1. Bubble-Sort");
  print("2. Inversi");
  print("3. Shuffle");

  stdout.write('Answer: ');
  int? answer = int.parse(stdin.readLineSync()!);
  
  switch (answer) {
    case 1:
      print('Before Bubble Sort: $numbers');
      bubblesort(numbers);
      print('After Bubble Sort: $numbers');
      break;
    case 2:
      print('Inversi not implemented yet.');
      break;
    case 3:
      print('Shuffle not implemented yet.');
      break;
    default:
      print('Invalid option');
  }
}

void bubblesort(List<int> numbers) {
  print('===============');
  print('  BUBBLE-SORT  ');
  print('===============');
  
  int n = numbers.length;
  bool swapped;

  // Loop utama menggunakan while
  while (n > 1) {  // Mengulangi hingga elemen terakhir sudah terurut
    swapped = false; // Reset flag di awal iterasi
    int i = 0; // Reset indeks ke awal setiap iterasi

    // Loop untuk cek elemen bersebelahan
    while (i < n - 1) {
      if (numbers[i] > numbers[i + 1]) {
        // Tukar elemen jika elemen sekarang lebih besar dari elemen berikutnya
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true; // Menandakan adanya pertukaran
      }
      i++; // Increment indeks
    }

    // Jika tidak ada pertukaran, array sudah terurut, keluar dari loop
    if (!swapped) break;

    n--; // Kurangi panjang untuk menghindari elemen yang sudah terurut
  }
}