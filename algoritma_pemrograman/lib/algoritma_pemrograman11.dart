void main() {
  int baterai = 100;
  int bateraiChat = 1;
  int bateraiVideo = 2;
  int bateraiGame = 3;

  int waktuChat = 60;
  int waktuVideo = 30;
  int waktuGame = 45;

  int totalBaterai = 0;

  totalBaterai += (waktuChat ~/ 5) * bateraiChat;
  totalBaterai += (waktuVideo ~/ 5) * bateraiVideo;
  totalBaterai += (waktuGame ~/ 5) * bateraiGame;

  int sisaBaterai = baterai - totalBaterai;

  print('==============');
  print(' SISA BATERAI ');
  print('==============');
  print('Sisa baterai setelah penggunaan: $sisaBaterai%');
}
