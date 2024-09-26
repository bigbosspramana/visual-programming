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

      print('Before Bubble-Sort -> $numbers');
      bubblesort(numbers);
      print('After Bubble-Sort -> $numbers');
      break;

    case '2':
      print('===============');
      print('    INVERSI    ');
      print('===============');

      print('Before Inversi -> $numbers');
      List<int> reverseNumbers = numbers.reversed.toList();
      print('After Inversi -> $reverseNumbers');
      break;

    case '3':
      print('==============');
      print('    SHUFFLE   ');
      print('==============');

      print('Before Shuffle -> $numbers');
      numbers.shuffle();
      print('After Shuffle -> $numbers');
      break;

    case '4':
      print('==============');
      print('   PIRAMIDA   ');
      print('==============');

      piramid_while(numbers);
      break;

    case '5':
      print('================');
      print('PIRAMIDA BERURUT');
      print('================');

      bubblesort(numbers);
      piramid_while(numbers);
      break;
  }
}
