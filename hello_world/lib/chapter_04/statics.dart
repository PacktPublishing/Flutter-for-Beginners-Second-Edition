class Person {
  String? firstName;
  String? lastName;

  static String personLabel = "Person name:";
  String get fullName => "$personLabel $firstName $lastName";

  set fullName(String fullName) {
    var parts = fullName.split(" ");
    this.firstName = parts.first;
    this.lastName = parts.last;
  }

  static void printsPerson(Person person) {
    print("$personLabel ${person.firstName} ${person.lastName}");
  }
}

main() {
  Person somePerson = Person();
  somePerson.firstName = "Clark";
  somePerson.lastName = "Kent";
  Person anotherPerson = Person();
  anotherPerson.firstName = "Peter";
  anotherPerson.lastName = "Parker";
  print(somePerson.fullName); // prints Person name: Clark kent
  print(anotherPerson.fullName); // prints Person name: Peter Parker
  Person.personLabel = "name:";
  print(somePerson.fullName); // prints name: Clark Kent
  print(anotherPerson.fullName); // prints name: Peter Parker
}
