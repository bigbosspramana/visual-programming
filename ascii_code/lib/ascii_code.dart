import 'dart:io';
import 'dart:async';
import 'dart:math';

const List<String> fireworkColors = [
  '\x1b[31m', // Merah (foreground)
  '\x1b[32m', // Hijau (foreground)
  '\x1b[34m', // Biru (foreground)
  '\x1b[35m', // Magenta (foreground)
  '\x1b[36m', // Cyan (foreground)
  '\x1b[33m', // Kuning (foreground)
  '\x1b[38;5;208m', // Oranye (foreground) dengan format warna khusus
];

const String reset = '\x1b[0m'; // Reset color

// Mendefinisikan pola untuk setiap huruf
const Map<String, List<String>> letterPatterns = {
  'H': [
    'H     H',
    'H     H',
    'H HHH H',
    'H     H',
    'H     H',
  ],
  'A': [
    '  A A  ',
    ' A   A ',
    ' AAAAA ',
    ' A   A ',
    ' A   A ',
  ],
  'P': [
    'PPPPPP ',
    'P     P',
    'PPPPPP ',
    'P      ',
    'P      ',
  ],
  'Y': [
    'Y     Y',
    ' Y   Y ',
    '  Y Y  ',
    '   Y   ',
    '   Y   ',
  ],
  'B': [
    'BBBBBB ',
    'B     B',
    'BBBBBB ',
    'B     B',
    'BBBBBB ',
  ],
  'I': [
    'IIIIIII',
    '   I   ',
    '   I   ',
    '   I   ',
    'IIIIIII',
  ],
  'R': [
    'RRRRR  ',
    'R    R ',
    'RRRRR  ',
    'R   R  ',
    'R    R ',
  ],
  'T': [
    'TTTTTTT',
    '   T   ',
    '   T   ',
    '   T   ',
    '   T   ',
  ],
  'D': [
    'DDDDD  ',
    'D    D ',
    'D    D ',
    'D    D ',
    'DDDDD  ',
  ],
  'K': [
    'K    K ',
    'K  K   ',
    'KK     ',
    'K  K   ',
    'K    K ',
  ],
  'N': [
    'N    N ',
    'NN   N ',
    'N N  N ',
    'N  N N ',
    'N    N ',
  ],
  'O': [
    ' OOOO  ',
    'O    O ',
    'O    O ',
    'O    O ',
    ' OOOO  ',
  ],
  ' ': [
    '        ',
    '        ',
    '        ',
    '        ',
    '        ',
  ],
};

// Fungsi untuk membersihkan terminal
void clearScreen() {
  stdout.write('\x1b[2J\x1b[H');
}

// Fungsi untuk memindahkan kursor ke posisi tertentu
void moveCursor(int x, int y) {
  stdout.write('\x1b[${y};${x}H');
}

void main() async {
  stdout.write('Masukkan jumlah kembang api yang ingin ditampilkan: ');
  int? fireworkCount = int.tryParse(stdin.readLineSync() ?? '');

  if (fireworkCount == null || fireworkCount <= 0) {
    print('Jumlah kembang api tidak valid. Program akan keluar.');
    return;
  }

  int height = stdout.terminalLines; // Menggunakan tinggi terminal saat ini
  int width = stdout.terminalColumns; // Menggunakan lebar terminal saat ini
  int center = width ~/ 2; // Posisi tengah secara horizontal
  int delayMs = 150; // Delay waktu untuk animasi (milidetik)

  // Pola kembang api yang lebih besar dan rapi
  final List<List<List<String>>> fireworkPatterns = [];
  
  for (int size = 3; size <= 7; size += 2) {
    List<List<String>> pattern = [];
    for (int row = 0; row < size; row++) {
      List<String> currentRow = [];
      for (int col = 0; col < size; col++) {
        if (row == size ~/ 2 || col == size ~/ 2 || row == col || row + col == size - 1) {
          currentRow.add('*');
        } else {
          currentRow.add(' ');
        }
      }
      pattern.add(currentRow);
    }
    fireworkPatterns.add(pattern);
  }

  // Fungsi untuk ledakan kembang api bertahap dari kecil ke besar
  Future<void> explodeFirework(int row, int col, String fireworkColor) async {
    String convertToBackground(String color) {
      if (color.startsWith('\x1b[38;5;')) {
        return color.replaceFirst('38;5;', '48;5;');
      } else {
        return color.replaceFirst('3', '4');
      }
    }

    String bgColor = convertToBackground(fireworkColor);

    for (var pattern in fireworkPatterns) {
      clearScreen();

      // Membuat background dengan warna yang diinginkan
      for (int j = 0; j < height; j++) {
        moveCursor(0, j);
        stdout.write(bgColor +
            ' ' * width +
            reset); // Mengisi layar dengan latar belakang
      }

      // Cetak pola kembang api saat ini
      for (int rowOffset = 0; rowOffset < pattern.length; rowOffset++) {
        for (int colOffset = 0;
            colOffset < pattern[rowOffset].length;
            colOffset++) {
          if (pattern[rowOffset][colOffset] != ' ') {
            moveCursor(
                col + colOffset - (pattern[0].length ~/ 2), row - rowOffset);
            stdout.write(reset +
                pattern[rowOffset][colOffset] +
                bgColor); // Menampilkan karakter
          }
        }
      }

      await Future.delayed(
          Duration(milliseconds: 500)); // Delay antara setiap ledakan
    }

    clearScreen();
  }

  // Fungsi utama animasi
  Future<void> startFirework(String color, int position) async {
    clearScreen();

    int stripCount = Random().nextInt(6) +
        3; // Menghasilkan jumlah strip acak antara 3 hingga 8
    for (int i = 0; i < stripCount; i++) {
      moveCursor(position, height - (i * 3));
      stdout.write('$color|$reset');
      await Future.delayed(Duration(milliseconds: delayMs));

      if (i < stripCount - 1) {
        moveCursor(position, height - (i * 3));
        stdout.write(' '); // Hapus strip sebelumnya
      }
    }

    await explodeFirework(height - (stripCount * 3) - 5, position,
        color); // Ledakan setelah strip selesai

    await Future.delayed(Duration(seconds: 2));
    clearScreen();
    stdout.write('\x1b[49m');
  }

  Random random = Random();
  List<String> usedColors = [];

  for (int i = 0; i < fireworkCount; i++) {
    clearScreen();
    String currentColor;

    do {
      currentColor = fireworkColors[random.nextInt(fireworkColors.length)];
    } while (usedColors.contains(currentColor));

    usedColors.add(currentColor);

    int position;
    if (i % 3 == 0) {
      position = center;
    } else if (i % 3 == 1) {
      position = width - 5;
    } else {
      position = 5;
    }

    await startFirework(currentColor, position);
  }

  clearScreen();
  stdout.write(reset);

  // Menampilkan tulisan "HAPPY BIRTHDAY" dan "PAK ANO" dari bawah ke tengah
  await displayMessage('HAPPY BIRTHDAY', height);
  await Future.delayed(Duration(seconds: 1));
  await displayMessage('PAK ANO', height);
}

// Fungsi untuk menampilkan pesan dari bawah ke tengah
Future<void> displayMessage(String message, int height) async {
  int messageHeight = 5; // Tinggi dari pesan
  int centerX = stdout.terminalColumns ~/ 2; // Posisi tengah secara horizontal
  int centerY = height ~/ 2; // Posisi tengah secara vertikal

  // Membuat daftar untuk setiap baris pola
  List<String> outputLines = List.generate(messageHeight, (index) => '');

  // Mengisi outputLines dengan pola untuk setiap huruf
  for (var char in message.split('')) {
    if (char.isNotEmpty && letterPatterns.containsKey(char)) {
      List<String> pattern = letterPatterns[char]!;
      for (int i = 0; i < pattern.length; i++) {
        outputLines[i] += pattern[i] + '   '; // Menambahkan spasi antar huruf
      }
    } else {
      for (int i = 0; i < outputLines.length; i++) {
        outputLines[i] += '        '; // Menambahkan spasi untuk huruf kosong
      }
    }
  }

  // Menampilkan hasil dari bawah ke tengah dengan warna-warni
  Random random = Random();
  for (int step = 0; step <= centerY - messageHeight ~/ 2; step++) {
    clearScreen();
    String messageColor = fireworkColors[random.nextInt(fireworkColors.length)];

    for (int i = 0; i < outputLines.length; i++) {
      int y = height - messageHeight + i - step;
      if (y >= 0 && y < height) {
        moveCursor(centerX - (outputLines[0].length ~/ 2), y);
        print(messageColor + outputLines[i] + reset);
      }
    }

    await Future.delayed(
        Duration(milliseconds: 50)); // Delay antara setiap langkah
  }

  await Future.delayed(
      Duration(seconds: 2)); // Tahan pesan di tengah selama 2 detik
}
