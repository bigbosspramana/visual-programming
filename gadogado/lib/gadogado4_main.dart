import 'dart:io';
import 'package:gadogado/gadogado4.dart';

void main() {
  Library perpustakaan = Library();

  while (true) {
    print('=============');
    print('   LIBRARY   ');
    print('=============');
    print('1. Add Book');
    print('2. Search n Remove Book');
    print('3. Check Books');
    print('4. Keluar');

    print('Answer: ');
    String answer = stdin.readLineSync()!;

    switch (answer) {
      case '1':
        print('=============');
        print('   ADD BOOK  ');
        print('=============');
        stdout.write('Judul Buku : ');
        String title = stdin.readLineSync()!;

        stdout.write('Pengarang: ');
        String author = stdin.readLineSync()!;

        stdout.write('Tahun Terbit: ');
        String year = stdin.readLineSync()!;

        perpustakaan.addBook(Book(title, author, year));
        print('Buku ditambahkan: $title oleh $author ($year)');
        break;

      case '2':
        print('=========================');
        print('   SEARCH n REMOVE BOOK  ');
        print('=========================');
        stdout.write('Search Book by Title: ');
        String search = stdin.readLineSync()!;

        Book? bookFound = perpustakaan.searchBook(search);

        if (bookFound != null) {
          print('Buku ditemukan:');
          print(
              'Title: ${bookFound.title}, Author: ${bookFound.author}, Year: ${bookFound.year}');

          stdout.write('Apakah Anda ingin menghapus buku ini? (yes/no): ');
          String? confirm = stdin.readLineSync();
          if (confirm?.toLowerCase() == 'yes') {
            perpustakaan.removeBook(bookFound.title);
            print('Buku "$search" berhasil dihapus.');
          }
          break;
        }

      case '3':
        print('=============');
        print(' CHECK BOOKS ');
        print('=============');
        perpustakaan.displayBooks();
        break;

      case '4':
        print('==============');
        print('    KELUAR    ');
        print('==============');
        print('Keluar dari program.');
        return;

      default:
        print('Pilihan yang Anda masukkan TIDAK VALID.');
    }
  }
}
