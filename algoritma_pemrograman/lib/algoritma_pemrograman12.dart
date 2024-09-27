void main() {
  int produksiJam = 20;
  int jamKerjaHari = 8;
  int hariKerjaMinggu = 5;

  int totalProduksiHari = produksiJam * jamKerjaHari;
  int totalProduksiMinggu = totalProduksiHari * hariKerjaMinggu;
  
  print('=============');
  print(' UNIT BARANG ');
  print('=============');
  print('Total unit barang yang dihasilkan dalam satu minggu: $totalProduksiMinggu');
}