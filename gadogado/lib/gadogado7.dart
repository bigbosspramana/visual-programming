class Vehicle {
  String _name; 
  double _speed; 

  Vehicle(this._name, this._speed);

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  double get speed => _speed;
  set speed(double value) {
    if (value >= 0) {
      _speed = value;
    } else {
      print("Speed cannot be negative.");
    }
  }

  void move() {
    print("Vehicle is moving");
  }
}

class car extends Vehicle {
  car(String name, double speed) : super(name, speed);

  @override
  void move() {
    if (speed > 60) {
      print("The car moves fast on roads");
    } else if (speed < 30) {
      print("The car moves slow on roads");
    } else if (speed >= 30 && speed <= 60) {
      print("The car moves normal on roads");
    }
  }
}

// Subclass: Bike
class bike extends Vehicle {
  bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    if (speed > 60) {
      print("The bike moves fast on roads");
    } else if (speed < 30) {
      print("The bike moves slow on roads");
    } else if (speed >= 30 && speed <= 60) {
      print("The bike moves normal on roads");
    }
  }
}


