piramid_while2(i, j, List<int> numbers, int arrayLength) {
  var row = '';
  j = 0;
  while (j <= i) {
    row += '${numbers[j % arrayLength]} ';
    j++;
  }
  return row;
}
