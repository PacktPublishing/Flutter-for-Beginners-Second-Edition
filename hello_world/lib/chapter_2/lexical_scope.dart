globalFunction() {
  print("Top-level globalFunction");
}

simpleFunction() {
  print("SimpleFunction");
  globalFunction() {
    print("Nested globalFunction");
  }

  globalFunction();
}

main() {
  simpleFunction();
  globalFunction();
}

// Prints:
// simpleFunction
// Nested globalFunction
// Top-level globalFunction
