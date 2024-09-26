import 'dart:io';
import 'dart:math';
import 'package:random_number/bubble_sort.dart';
import 'package:random_number/piramida_while0.dart';

void main() {
  stdout.write('How much number u want to generate : ');
  int? number = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  var i = 0;
  Random rng = Random();
  while (i++ < number) {
    int rdNum = rng.nextInt(100);
    numbers.add(rdNum);
  }
  print(numbers);

  Stopwatch stopwatch = Stopwatch();

  print("====================");
  print(" CHOOSE NUMBERS 1-3 ");
  print("====================");
  print("1. Bubble-Sort");
  print("2. Inversi");
  print("3. Shuffle");
  print("4. Piramid");
  print("5. Piramid Berurut");

  print('Answer : ');
  String answer = stdin.readLineSync()!;
  switch (answer) {
    case '1':
      print('===============');
      print('  BUBBLE-SORT  ');
      print('===============');

      stopwatch.start();
      print('Before Bubble-Sort -> $numbers');
      bubblesort(numbers);
      print('After Bubble-Sort -> $numbers');
      stopwatch.stop();
      print('Time Bubble Sort : ${stopwatch.elapsedMilliseconds} ms');
      break;

    case '2':
      print('===============');
      print('    INVERSI    ');
      print('===============');

      stopwatch.start();
      print('Before Inversi -> $numbers');
      List<int> inversiNumbers = numbers.reversed.toList();
      print('After Inversi -> $inversiNumbers');
      stopwatch.stop();
      print('Time Inversi : ${stopwatch.elapsedMilliseconds} ms');
      break;

    case '3':
      print('==============');
      print('    SHUFFLE   ');
      print('==============');

      stopwatch.start();
      print('Before Shuffle -> $numbers');
      numbers.shuffle();
      print('After Shuffle -> $numbers');
            stopwatch.stop();
      print('Time Shuffle : ${stopwatch.elapsedMilliseconds} ms');
      break;

    case '4':
      print('==============');
      print('    PYRAMID   ');
      print('==============');

      stopwatch.start();
      piramid_while(numbers);
      stopwatch.stop();
      print('Time Pyramid : ${stopwatch.elapsedMilliseconds} ms');
      break;

    case '5':
      print('================');
      print('SEQUENCE PYRAMID');
      print('================');

      stopwatch.start();
      bubblesort(numbers);
      piramid_while(numbers);
      stopwatch.stop();
      print('Time Sequence Pyramid : ${stopwatch.elapsedMilliseconds} ms');
      break;
  }
}
