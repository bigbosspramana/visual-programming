import 'package:random_number/whilechecked.dart';

void bubblesort(numbers) {
  int n = numbers.length;
  bool swapped;

  while (n > 1) {
    swapped = false; 
    int i = 0; 

    swapped = whilechecked(numbers, i, n, swapped);

    if (!swapped) break;

    n--;
  }
}
