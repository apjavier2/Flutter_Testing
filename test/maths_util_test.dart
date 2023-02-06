import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/maths_util.dart';

void main() {
  group('Math utils - ', () {
    test("check for two number addition", () {
      //ARRANGE
      var a = 10;
      var b = 10;

      //ACT
      var output = add(a, b);

      //ASSERT
      expect(output, 20);
    });

    test("check for two number subtraction", () {
      //ARRANGE
      var a = 10;
      var b = 10;

      //ACT
      var output = subtract(a, b);

      //ASSERT
      expect(output, 0);
    });

    test("check for two number multiplication", () {
      //ARRANGE
      var a = 10;
      var b = 10;

      //ACT
      var output = multiply(a, b);

      //ASSERT
      expect(output, 100);
    });
  });
}
