bool whilechecked(numbers, int i, int n, bool swapped) {
  while (i < n - 1) {
    if (numbers[i] > numbers[i + 1]) {
      int temp = numbers[i];
      numbers[i] = numbers[i + 1];
      numbers[i + 1] = temp;
      swapped = true; 
    }
    i++; 
  }
  
  return swapped;
}
