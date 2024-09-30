class Student {
  String _name;
  String _studentid;
  int _grade;

  Student(this._name, this._studentid, this._grade);

  String get name => _name;
  set name(String name) {
    _name = name;
  }

  String get studentid => _studentid;
  set studentid(String studentid) {
    _studentid = studentid;
  }

  int get grade => _grade;
  set grade(int grade) {
    _grade = grade;
  }

  @override
  String toString() {
    return 'Student Name: $_name, ID: $_studentid, Grade: $_grade';
  }
}


