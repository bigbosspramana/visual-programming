class Node<T> {
  T? value;
  Node<T>? next;

  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head;

  LinkedList();

  bool get isEmpty => head == null;

  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      head = newNode;
    } else {
      var current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
  }

  void remove(T value) {
    if (isEmpty) return;

    if (head?.value == value) {
      head = head?.next;
      return;
    }

    var current = head;
    while (current?.next != null) {
      if (current?.next?.value == value) {
        current?.next = current?.next?.next;
        return;
      }
      current = current?.next;
    }
  }

  void printList() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
    print('null');
  }
}

void main() {
  final linkedList = LinkedList<int>();

  print("Data sebelum di hapus : ");
  linkedList.add(10);
  linkedList.add(20);
  linkedList.add(30);

  linkedList.printList();

  print("Data setelah di hapus : ");
  linkedList.remove(20);

  linkedList.printList();
}
