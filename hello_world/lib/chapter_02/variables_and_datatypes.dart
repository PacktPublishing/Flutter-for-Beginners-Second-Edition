void variableDeclaration() {
  var inferredString = "Hello"; // Type inferred as String
  String explicitString = "World";
}

void nullUnsafeExample() {
  // Old null unsafe code examples
  /*
  int newNumber; // newNumber is initialized to null
  print(newNumber); // Prints null
  newNumber = 42; // Update the value of newNumber
  print(newNumber); // Prints 42
  */
}

void questionMarkDeclaration() {
  int? newNumber; // newNumber type allows nullability
  print(newNumber); // Prints null
  newNumber = 42; // Update the value of newNumber
  print(newNumber); // Prints 42
}

void lateDeclaration() {
  late int newNumber; // newNumber type allows nullability
  // Do some initialisation stuff
  newNumber = 42; // Update the value of newNumber
  print(newNumber); // Prints 42
}

void accessingNullableVariables() {
  int? goals;
// Other code
  // print(goals + 2); Goals is null, so add check
  if (goals != null) {
    print(goals + 2);
  }
}

void lists() {
  List dynamicList = [];
  print(dynamicList.length); // Prints 0
  dynamicList.add("Hello");
  print(dynamicList[0]); // Prints “World”
  print(dynamicList.length); // Prints 1
  List preFilledDynamicList = [1, 2, 3];
  print(preFilledDynamicList[0]); // Prints 1
  print(preFilledDynamicList.length); // Prints 3

  List fixedList = List.filled(3, "World");
  fixedList.add("Hello"); // Error
  fixedList[0] = "Hello";
  print(fixedList[0]); // Prints “Hello”;
  print(fixedList[1]); // Prints “World”;
}

void maps() {
  Map nameAgeMap = {};
  nameAgeMap["Alice"] = 23;
  print(nameAgeMap["Alice"]); // Prints 23
}

void strings() {
  String singleQuoteString = 'Here is a single quote string';
  String doubleQuoteString = "Here is a double quote string";

  String multiLineString = '''Here is a multi-line single
 quote string''';

  String str1 = 'Here is a ';
  String str2 = str1 + 'concatenated string';
  print(str2); // Prints Here is a concatenated string
}

void stringInterpolation() {
  String someString = "Happy string";
  print("The string is: $someString");
  // prints The string is: Happy string
  // No curly brackets were required
  print("The string length is: ${someString.length}");
  // prints The string length is: 16
  // Curly brackets were required
  print("The string length is: $someString.length");
  // prints The string length is: Happy string.length
  // Omitting the curly brackets meant only the variable was evaluated, not the method on the variable.
}

void ifElse() {
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }
  // Prints Test2
  if (test == "test2") print("Test2 again"); // Prints Test 2

  /* Truthy not used in Dart
  String test = "true";
  if (test) {
    // Creates a compilation error
    print("Truthy");
  }
  */
}

void whileDoWhile() {
  int counter = 0;
  while (counter < 2) {
    print(counter);
    counter++;
  }
  // Prints 0, 1
  do {
    print(counter);
    counter++;
  } while (counter < 2);
  // Prints 2
}

void forLoop() {
  for (int index = 0; index < 2; index++) {
    print(index);
  }
  // Prints 0, 1
}

void breakContinue() {
  int counter = 0;
  while (counter < 10) {
    counter++;
    if (counter == 4) {
      break;
    } else if (counter == 2) {
      continue;
    }
    print(counter);
  }
  // Prints 1, 3
}
