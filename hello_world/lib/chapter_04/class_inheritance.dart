abstract class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);
  String get fullName;
}

class Student extends Person {
  String nickName;
  Student(
    String firstName,
    String lastName,
    this.nickName,
  ) : super(firstName, lastName);

  @override
  String get fullName => "$firstName $lastName";

  @override
  String toString() => "$fullName, aka $nickName";
}

main() {
  Student student = Student("Clark", "Kent", "Kal-El");
  print(student);
}
