void main() {
  int? goalTime;
  String? goalScorer;
  bool goalScored = false;
  // Other code
  if (goalScored) {
    goalTime = 21;
    goalScorer = "Bobby";
  }
  // More code
  if (goalTime != null) {
    // print(goalScorer.length); // Doesn't compile
  }

  if (goalTime != null) {
    print(goalScorer!.length);
  }
}
