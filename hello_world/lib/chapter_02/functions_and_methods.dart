void main() {
  var helloFunction = sayHello;
  String helloMessage = helloFunction();
  print(helloMessage);
}

String sayHello() {
  return "Hello world!";
}
