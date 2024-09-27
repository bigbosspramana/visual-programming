void main() {
  print('===================');
  print(' PENGUNAAN LISTRIK ');
  print('===================');

  double konsumsiAC = 1.5; 
  double konsumsiTV = 0.2; 
  double konsumsiLampu = 0.1; 
  
  int jamAC = 8; 
  int jamTV = 5; 
  int jamLampu = 12; 

  double totalKonsumsi = (konsumsiAC * jamAC) + (konsumsiTV * jamTV) + (konsumsiLampu * jamLampu);

  print('Total konsumsi energi harian: ${totalKonsumsi} kWh');
}