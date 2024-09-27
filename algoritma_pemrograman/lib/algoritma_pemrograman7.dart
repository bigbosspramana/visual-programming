void main() {
  List<String> tugas = ['Tugas A', 'Tugas B', 'Tugas C', 'Tugas D', 'Tugas E'];
  List<String> urutanTugas = [];

  urutanTugas.add(tugas[0]); 
  urutanTugas.add(tugas[1]); 
  urutanTugas.add(tugas[2]); 
  urutanTugas.add(tugas[3]); 
  urutanTugas.add(tugas[4]); 

  print('===================');
  print('URUTAN PENYELESAIAN');
  print('===================');
  
  int i = 0; 
  while (i < urutanTugas.length) {
    print('${i + 1}. ${urutanTugas[i]}'); 
    i++;
  }
}
