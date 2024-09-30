import 'dart:io';
import 'package:gadogado/gadogado1.dart'; 

void addStudent(List<Student> studentList) {
  stdout.write('Input Student Name: ');
  String name = stdin.readLineSync()!;
  stdout.write('Input Student ID: ');
  String studentid = stdin.readLineSync()!;
  stdout.write('Input Grade: ');
  int grade = int.parse(stdin.readLineSync()!);
  
  Student student = Student(name, studentid, grade);
  studentList.add(student);
}

void main() {
  List<Student> studentList = [];

  print('===================');
  print('   STUDENT CLASS   ');
  print('===================');
  addStudent(studentList);

  print('===================');
  print('   CHOOSE NUMBER   ');
  print('===================');
  print('1. Add Student');
  print('2. List Student');
  print('3. Graduate');

  print('Answer: ');
  String answer = stdin.readLineSync()!;
  
  switch (answer) {
    case '1':
      print('===================');
      print('    ADD STUDENT    ');
      print('===================');
      addStudent(studentList);
      print(studentList);

    case '2':
      print('===================');
      print('    LIST STUDENT   ');
      print('===================');
      print(studentList);
      break;
    
    case '3':
      print('====================');
      print('  GRADUATE STUDENT  ');
      print('====================');
      stdout.write('Searching Name or ID Student: ');
      String search = stdin.readLineSync()!;
      
      Student? studentByName = studentList.firstWhere(
        (student) => student.name == search,
        orElse: () => Student('Not Found', 'N/A', 0),
      );

      Student? studentById = studentList.firstWhere(
        (student) => student.studentid == search,
        orElse: () => Student('Not Found', 'N/A', 0),
      );

      if (studentByName.name != 'Not Found') {
        String graduationStatus = (studentByName.grade >= 70) ? 'Lulus' : 'Tidak Lulus';
        print(
          'Name: ${studentByName.name}\n'
          'ID: ${studentByName.studentid}\n' 
          'Grade: ${studentByName.grade}\n' 
          'Status: $graduationStatus');
      } else if (studentById.name != 'Not Found') {
        String graduationStatus = (studentById.grade >= 70) ? 'Lulus' : 'Tidak Lulus';
        print(
          'Name: ${studentById.name}\n'
          'ID: ${studentById.studentid}\n' 
          'Grade: ${studentById.grade}\n' 
          'Status: $graduationStatus');
      } else {
        print('Student not found');
      }
      break;

    default:
      print('Angka yang Anda masukkan TIDAK VALID.');
  }
}
