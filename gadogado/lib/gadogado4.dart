class Book {
  String title;
  String author;
  String  year;

  Book(this.title, this.author, this.year);
}

class Library {
  List<Book> buku = []; 

  void addBook(Book book) {
    buku.add(book); 
  }

  void removeBook(String title) {
    buku.removeWhere((book) => book.title == title); 
  }

  Book? searchBook(String title) {
    return buku.firstWhere(
      (book) => book.title.toLowerCase() == title.toLowerCase(), 
    );
  }

  void displayBooks() {
    if (buku.isEmpty) {
      print('No books available in the library.');
      return;
    }
    for (var book in buku) {
      print(
        'Title: ${book.title}\n'
        'Author: ${book.author}\n'
        ' Year: ${book.year}'); 
    }
  }
}