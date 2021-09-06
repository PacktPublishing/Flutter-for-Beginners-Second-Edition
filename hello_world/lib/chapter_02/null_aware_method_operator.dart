void main() {
  // With null check
  String? goalScorer1;
  // Other code
  if (goalScorer1 != null) {
    print(goalScorer1.length);
  }

  // With null aware method operator
  String? goalScorer2;
  // Other code
  print(goalScorer2?.length);
}
