void main() {
  int produksiPerJam = 20;
  int jamKerjaPerHari = 8;
  int hariKerjaPerMinggu = 5;

  int totalProduksiPerHari = produksiPerJam * jamKerjaPerHari;
  int totalProduksiPerMinggu = totalProduksiPerHari * hariKerjaPerMinggu;
  
  print('=============');
  print(' UNIT BARANG ');
  print('=============');
  print('Total unit barang yang dihasilkan dalam satu minggu: $totalProduksiPerMinggu');
}