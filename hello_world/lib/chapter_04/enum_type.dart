import 'package:flutter/foundation.dart';

enum PersonType { student, employee }

class Person {
  String? firstName;
  String? lastName;

  late PersonType type;

  String getFullName() => "$firstName $lastName";
}

main() {
  print(PersonType.values);
  Person somePerson = Person();
  somePerson.type = PersonType.employee;
  print(somePerson.type);
  print(somePerson.type.index);
  print(describeEnum(PersonType.employee));
}
