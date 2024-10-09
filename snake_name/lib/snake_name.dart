import 'dart:io';
import 'dart:async';
import 'dart:math';

class Node {
  String value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;

  void add(String value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
  }

  Node? getNext(Node node) {
    return node.next;
  }

  Future<void> printNamePattern(List<String> colors) async {
    int terminalWidth = stdout.terminalColumns;
    int terminalHeight = stdout.terminalLines - 1;

    Node? currentNode = head;

    for (int colorIndex = 0; colorIndex < colors.length; colorIndex++) {
      currentNode = head;

      for (int row = 1; row <= terminalHeight; row++) {
        if (currentNode == null) currentNode = head;

        if (row % 2 != 0) {
          for (int col = 1; col <= terminalWidth; col++) {
            moveTo(row, col);
            stdout.write(colors[colorIndex]);
            stdout.write(currentNode!.value);
            currentNode = getNext(currentNode) ?? head;
            await Future.delayed(Duration(milliseconds: 10));
          }
        } else {
          for (int col = terminalWidth; col > 0; col--) {
            moveTo(row, col);
            stdout.write(colors[colorIndex]);
            stdout.write(currentNode!.value);
            currentNode = getNext(currentNode) ?? head;
            await Future.delayed(Duration(milliseconds: 10));
          }
        }
      }

      if (colorIndex == colors.length - 1) {
        break;
      }

      await Future.delayed(Duration(seconds: 2));
    }
  }

  void moveTo(int row, int col) {
    stdout.write('\x1B[${row};${col}H');
  }
}

List<String> generateRandomColors(int count) {
  List<String> availableColors = [
    '\x1B[31m', // Red
    '\x1B[32m', // Green
    '\x1B[33m', // Yellow
    '\x1B[34m', // Blue
    '\x1B[35m', // Magenta
    '\x1B[36m', // Cyan
    '\x1B[90m', // Bright Black (Gray)
    '\x1B[91m', // Bright Red
    '\x1B[92m', // Bright Green
    '\x1B[93m', // Bright Yellow
    '\x1B[94m', // Bright Blue
    '\x1B[95m', // Bright Magenta
    '\x1B[96m', // Bright Cyan
    '\x1B[97m', // Bright White
  ];

  Random random = Random();
  List<String> randomColors = [];

  randomColors.add('\x1B[37m');

  for (int i = 0; i < count - 1; i++) {
    randomColors.add(availableColors[random.nextInt(availableColors.length)]);
  }

  return randomColors;
}

void main() async {
  LinkedList linkedList = LinkedList();

  print("==============");
  print("  SNAKE NAME  ");
  print("==============");

  print("Masukkan nama yang ingin ditampilkan:");
  String? inputName = stdin.readLineSync();

  if (inputName != null && inputName.isNotEmpty) {
    for (int i = 0; i < inputName.length; i++) {
      linkedList.add(inputName[i]);
    }
  } else {
    print("Nama tidak valid, menggunakan nama default.");
    String defaultName = "ALVIN YUGA PRAMANA";
    for (int i = 0; i < defaultName.length; i++) {
      linkedList.add(defaultName[i]);
    }
  }

  print("Masukkan berapa banyak warna yang diinginkan:");
  String? input = stdin.readLineSync();

  stdout.write('\x1B[2J\x1B[0;0H');

  int colorCount = 0;

  if (input != null && int.tryParse(input) != null) {
    colorCount = int.parse(input);
  } else {
    print("Input tidak valid, menggunakan warna default.");
    colorCount = 7;
  }

  if (colorCount <= 0) {
    print("Jumlah warna tidak valid, sistem akan berhenti.");
    return;
  }

  List<String> randomColors = generateRandomColors(colorCount);

  await linkedList.printNamePattern(randomColors);
}
