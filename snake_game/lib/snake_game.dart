import 'dart:io';
import 'dart:math';
import 'dart:async';

class LizardGame {
  final String foodSymbol;
  late List<List<int>> lizardBody;
  late int foodX;
  late int foodY;
  late int width;
  late int height;
  late String currentDirection;
  late bool isGameOver;

  LizardGame(this.foodSymbol) {
    List<int> terminalSize = _getTerminalSize();
    width = terminalSize[0];
    height = terminalSize[1];
    lizardBody = [
      [width ~/ 2, height ~/ 2],     // Kepala
      [width ~/ 2 - 1, height ~/ 2], // Badan
      [width ~/ 2 - 2, height ~/ 2], // Badan
      [width ~/ 2 - 3, height ~/ 2], // Badan
      [width ~/ 2 - 4, height ~/ 2], // Badan
    ];
    currentDirection = 'right';
    isGameOver = false;
    _spawnFoodRandomly();
  }

  List<int> _getTerminalSize() {
    try {
      ProcessResult result = Process.runSync('stty', ['size']);
      String output = result.stdout.toString().trim();
      if (output.isEmpty) {
        return [80, 24];
      }
      List<String> size = output.split(' ');
      if (size.length != 2) {
        return [80, 24];
      }
      int terminalHeight = int.parse(size[0]);
      int terminalWidth = int.parse(size[1]);
      return [terminalWidth, terminalHeight];
    } catch (e) {
      return [80, 24];
    }
  }

  void _spawnFoodRandomly() {
    Random random = Random();
    do {
      foodX = random.nextInt(width);
      foodY = random.nextInt(height);
    } while (lizardBody.any((segment) => segment[0] == foodX && segment[1] == foodY));
  }

  void move() {
    List<int> newHead = List.from(lizardBody.first);
    switch (currentDirection) {
      case 'up':
        newHead[1] = (newHead[1] - 1 + height) % height;
        break;
      case 'down':
        newHead[1] = (newHead[1] + 1) % height;
        break;
      case 'left':
        newHead[0] = (newHead[0] - 1 + width) % width;
        break;
      case 'right':
        newHead[0] = (newHead[0] + 1) % width;
        break;
    }

    if (lizardBody.sublist(1).any((segment) => segment[0] == newHead[0] && segment[1] == newHead[1])) {
      isGameOver = true;
      return;
    }

    lizardBody.insert(0, newHead);

    if (newHead[0] == foodX && newHead[1] == foodY) {
      _spawnFoodRandomly();
      // Tambahkan segmen tubuh baru
      lizardBody.insert(1, List.from(lizardBody[1]));
    } else {
      lizardBody.removeLast();
    }
  }

  void chooseDirection() {
    List<String> availableDirections = ['up', 'down', 'left', 'right'];
    availableDirections.remove(_getOppositeDirection(currentDirection));

    availableDirections.sort((a, b) {
      int distanceA = _calculateDistance(_getFuturePosition(a), [foodX, foodY]);
      int distanceB = _calculateDistance(_getFuturePosition(b), [foodX, foodY]);
      return distanceA.compareTo(distanceB);
    });

    currentDirection = availableDirections.first;
  }

  String _getOppositeDirection(String dir) {
    switch (dir) {
      case 'up': return 'down';
      case 'down': return 'up';
      case 'left': return 'right';
      case 'right': return 'left';
      default: return '';
    }
  }

  List<int> _getFuturePosition(String dir) {
    List<int> nextPosition = List.from(lizardBody.first);
    switch (dir) {
      case 'up':
        nextPosition[1] = (nextPosition[1] - 1 + height) % height;
        break;
      case 'down':
        nextPosition[1] = (nextPosition[1] + 1) % height;
        break;
      case 'left':
        nextPosition[0] = (nextPosition[0] - 1 + width) % width;
        break;
      case 'right':
        nextPosition[0] = (nextPosition[0] + 1) % width;
        break;
    }
    return nextPosition;
  }

  int _calculateDistance(List<int> position1, List<int> position2) {
    return (position1[0] - position2[0]).abs() + (position1[1] - position2[1]).abs();
  }

  void render() {
    List<List<String>> grid = List.generate(height, (_) => List.generate(width, (_) => ' '));

    // Gambar tubuh cicak
    for (int i = 1; i < lizardBody.length - 1; i++) {
      grid[lizardBody[i][1]][lizardBody[i][0]] = 'o';
    }

    // Gambar kepala cicak
    var head = lizardBody.first;
    grid[head[1]][head[0]] = _getHeadSymbol();

    // Gambar kaki dan tangan cicak
    if (lizardBody.length > 2) {
      var neck = lizardBody[1];
      _drawLimbs(grid, neck);
    }
    if (lizardBody.length > 3) {
      var tail = lizardBody[lizardBody.length - 2];
      _drawLimbs(grid, tail);
    }

    // Gambar makanan
    grid[foodY][foodX] = foodSymbol;

    print('\x1B[2J\x1B[0;0H'); // Bersihkan layar
    for (var row in grid) {
      print(row.join());
    }
  }

  String _getHeadSymbol() {
    switch (currentDirection) {
      case 'up': return '^';
      case 'down': return 'v';
      case 'left': return '<';
      case 'right': return '>';
      default: return 'o';
    }
  }

  void _drawLimbs(List<List<String>> grid, List<int> position) {
    var x = position[0];
    var y = position[1];

    // Gambar tangan
    if (y > 0) grid[y-1][x] = 'o';
    if (y < height - 1) grid[y+1][x] = 'o';

    // Gambar kaki
    if (x > 0) grid[y][x-1] = 'o';
    if (x < width - 1) grid[y][x+1] = 'o';
  }

  void start() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (isGameOver) {
        timer.cancel();
        print('Permainan Selesai!');
        return;
      }

      chooseDirection();
      move();
      render();
    });
  }
}

void main() {
  LizardGame game = LizardGame('+');
  game.start();
}
