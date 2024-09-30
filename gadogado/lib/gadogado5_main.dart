import 'dart:io';
import 'package:gadogado/gadogado5.dart';

void main () {
  while (true) {
    print('=============');
    print('   ANIMALS   ');
    print('=============');
    print('1. Dog');
    print('2. Cat');

    print('Answer : ');
    String answer = stdin.readLineSync()!;

    switch (answer) {
      case '1':
        print('=============');
        print('     DOG     ');
        print('=============');
        Dog dog = Dog();
        dog.sound(); 
        dog.eat();

      case '2':
        print('=============');
        print('     CAT     ');
        print('=============');
        Cat cat = Cat();
        cat.sound(); 
        cat.eat();
    }
  }
}