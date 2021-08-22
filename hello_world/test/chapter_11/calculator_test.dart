import 'package:hello_world/chapter_11/calculator.dart';
import 'package:test/test.dart';

void main() {
  late Calculator _calculator;

  setUp(() {
    _calculator = Calculator();
  });

  test(
    'calculator.sumTwoNumbers() sum both numbers',
    () => expect(_calculator.sumTwoNumbers(1, 2), 3),
  );
}
