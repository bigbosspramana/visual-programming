void main() {
  int bateraiAwal = 100;
  int bateraiChatting = 1;
  int bateraiVideo = 2;
  int bateraiGame = 3;

  int waktuChatting = 60;
  int waktuVideo = 30;
  int waktuGame = 45;

  int totalPenggunaanBaterai = 0;

  totalPenggunaanBaterai += (waktuChatting ~/ 5) * bateraiChatting;
  totalPenggunaanBaterai += (waktuVideo ~/ 5) * bateraiVideo;
  totalPenggunaanBaterai += (waktuGame ~/ 5) * bateraiGame;

  int sisaBaterai = bateraiAwal - totalPenggunaanBaterai;

  print('==============');
  print(' SISA BATERAI ');
  print('==============');
  print('Sisa baterai setelah penggunaan: $sisaBaterai%');
}
