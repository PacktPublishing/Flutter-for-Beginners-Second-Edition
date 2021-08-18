class Person {
  String? firstName;
  String? lastName;

  set fullName(String fullName) {
    var parts = fullName.split(" ");
    this.firstName = parts.first;
    this.lastName = parts.last;
  }

  String get fullName => "$firstName $lastName";
}

main() {
  Person somePerson = new Person();
  somePerson.firstName = "Clark";
  somePerson.lastName = "Kent";

  print(somePerson.fullName); // prints Clark Kent
  somePerson.fullName = "peter parker";
}
