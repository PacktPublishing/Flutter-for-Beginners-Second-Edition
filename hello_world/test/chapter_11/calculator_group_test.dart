import 'package:hello_world/chapter_11/calculator.dart';
import 'package:test/test.dart';

void main() {
  late Calculator _calculator;

  setUp(() {
    _calculator = Calculator();
  });

  group("calculator tests", () {
    test(
      'sumTwoNumbers() sum both numbers',
      () => expect(_calculator.sumTwoNumbers(1, 2), 3),
    );
    test(
      'sumTwoNumbers() sum negative number',
      () => expect(_calculator.sumTwoNumbers(1, -1), 0),
    );
  });
}
