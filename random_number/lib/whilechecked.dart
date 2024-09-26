bool whilechecked(numbers, int i, int n, bool swapped) {
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
  
  // Kembalikan nilai swapped agar bisa digunakan di luar fungsi
  return swapped;
}
