class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);
  String getFullName() => "$firstName $lastName";
}

void main() {
  // Person somePerson = Person(); No longer compiles
  Person somePerson = Person("Clark", "Kent");
  print(somePerson.getFullName());
}
