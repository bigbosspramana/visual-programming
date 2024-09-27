void main () {
  int isiUang = 5000;
  int jumlahHari = 30;
  int jumlahUang = 0;

  print("============");
  print(" UANG SINTA ");
  print("============");

  int today = 1;
  while (today <= jumlahHari) {
    jumlahUang = isiUang * 30;
    today++;
  }

  print ('Jumlah uang yang dimiliki Sinta : Rp.$jumlahUang');
}