void main() {
  print('===============');
  print(' ANTRIAN LOKET ');
  print('===============');
  List<String> nasabah = ['A', 'B', 'C', 'D', 'E'];
  int loket1 = 1;
  int loket2 = 2;

  int i = 0;
  while (i < nasabah.length) {
    if (i % 2 == 0) {
      print('Nasabah ${nasabah[i]} dilayani di Loket $loket1');
    } else {
      print('Nasabah ${nasabah[i]} dilayani di Loket $loket2');
    }
    i++;
  }
}
