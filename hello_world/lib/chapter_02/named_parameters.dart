void main() {
  String greeting = sayHappyBirthday("Laura", age: 21);
  print(greeting);
}
// Prints Happy birthday Robert! You are 21 years old.

sayHappyBirthday(String name, {required int age}) {
  return "Happy birthday $name! You are $age years old.";
}
