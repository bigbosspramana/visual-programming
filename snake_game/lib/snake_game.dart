import 'dart:async';
import 'dart:io';
import 'dart:math';

class Point {
  int x, y;
  Point(this.x, this.y);
}

class CicakGame {
  List<Point> cicak;
  late Point food;
  String direction;
  Random random = Random();
  late int rows, cols;

  CicakGame()
      : cicak = generateCicak(40, 15), 
        direction = 'RIGHT' {
    updateTerminalSize();
    generateFood();
  }

  // Fungsi untuk menghasilkan pola cicak yang diinginkan
  static List<Point> generateCicak(int startX, int startY) {
    return [
      Point(startX, startY),        // Tengah
      Point(startX, startY - 1),    // Atas
      Point(startX - 1, startY - 1), // Kiri atas
      Point(startX + 1, startY - 1), // Kanan atas
      Point(startX - 2, startY - 1), // Kiri jauh atas
      Point(startX + 2, startY - 1), // Kanan jauh atas
      Point(startX, startY + 1),    // Bawah
      Point(startX - 1, startY + 1), // Kiri bawah
      Point(startX + 1, startY + 1), // Kanan bawah
      Point(startX - 2, startY + 1), // Kiri jauh bawah
      Point(startX + 2, startY + 1), // Kanan jauh bawah
    ];
  }

  void updateTerminalSize() {
    rows = stdout.terminalLines - 1;
    cols = stdout.terminalColumns;
  }

  void generateFood() {
    food = Point(random.nextInt(cols), random.nextInt(rows));
    while (cicak.any((point) => point.x == food.x && point.y == food.y)) {
      food = Point(random.nextInt(cols), random.nextInt(rows));
    }
  }

  void draw() {
    var buffer = StringBuffer();

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (cicak.any((point) => point.x == j && point.y == i)) {
          buffer.write('O');
        } else if (food.x == j && food.y == i) {
          buffer.write('*'); 
        } else {
          buffer.write(' ');
        }
      }
      buffer.writeln();
    }
    stdout.write('\x1B[2J\x1B[0;0H');
    stdout.write(buffer.toString());
  }

  void moveCicak() {
    Point head = cicak[0];
    Point newHead = Point(head.x, head.y);

    if (direction == 'UP') newHead.y--;
    if (direction == 'DOWN') newHead.y++;
    if (direction == 'LEFT') newHead.x--;
    if (direction == 'RIGHT') newHead.x++;

    if (newHead.x < 0) newHead.x = cols - 1;
    if (newHead.x >= cols) newHead.x = 0;
    if (newHead.y < 0) newHead.y = rows - 1;
    if (newHead.y >= rows) newHead.y = 0;

    for (int i = cicak.length - 1; i > 0; i--) {
      cicak[i] = cicak[i - 1];
    }
    cicak[0] = newHead;

    if (newHead.x == food.x && newHead.y == food.y) {
      generateFood();
      cicak.add(Point(-1, -1));
    }
  }

  void updateDirection() {
    if (cicak[0].x < food.x) {
      direction = 'RIGHT';
    } else if (cicak[0].x > food.x) {
      direction = 'LEFT';
    } else if (cicak[0].y < food.y) {
      direction = 'DOWN';
    } else {
      direction = 'UP';
    }
  }

  void run() async {
    while (true) {
      updateTerminalSize();
      updateDirection();
      moveCicak();
      draw();

      await Future.delayed(Duration(milliseconds: 100));
    }
  }
}

void main() {
  CicakGame game = CicakGame();
  game.run();
}
