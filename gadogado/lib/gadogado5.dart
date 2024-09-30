class Animal {
  void sound() {
    print('Hewan Bersuara');
  }

  void eat() {
    print('Hewan Lapar');
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog -> Guk Guk Guk!");
  }

  @override
  void eat() {
    print("Dog want to eats bones");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Cat -> Meowwwwwwww");
  }

  @override
  void eat() {
    print("Cat want to eats fish");
  }
}
