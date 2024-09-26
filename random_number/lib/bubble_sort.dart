import 'package:random_number/whilechecked.dart';

void bubblesort(numbers) {
  int n = numbers.length;
  bool swapped;

  // Loop utama menggunakan while
  while (n > 1) {
    swapped = false; // Reset flag di awal iterasi
    int i = 0; // Reset indeks ke awal setiap iterasi

    // Memperbarui swapped berdasarkan hasil dari whilechecked
    swapped = whilechecked(numbers, i, n, swapped);

    // Jika tidak ada pertukaran, array sudah terurut, keluar dari loop
    if (!swapped) break;

    n--; // Kurangi panjang untuk menghindari elemen yang sudah terurut
  }
}
