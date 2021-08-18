void main() {
  var hello = sayHappyBirthday('Robert');
  print(hello);
}
// Prints Happy birthday Robert! You are 21 years old.

sayHappyBirthday(String name, [int age = 21]) {
  return "Happy birthday $name! You are $age years old.";
}
