import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/validator.dart';

void main() {
  test('validate for empty email id', () {
    //Arrange and Act
    var result = Validator.validateEmail('');

    //Assert
    expect(result, "Required Field");
  });

  test('validate for invalid email id', () {
    //Arrange and Act
    var result = Validator.validateEmail('asdasfdfa');

    //Assert
    expect(result, "Please enter a valid email id");
  });

  test('validate for valid email id', () {
    //Arrange and Act
    var result = Validator.validateEmail('apjavier27@gmail.com');

    //Assert
    expect(result, null);
  });

  test('validate for empty password', () {
    //Arrange and Act
    var result = Validator.validatePassword('');

    //Assert
    expect(result, "Required Field");
  });

  test('validate for invalid password', () {
    //Arrange and Act
    var result = Validator.validatePassword('pass');

    //Assert
    expect(result, "Please enter atleast 8 characters for password");
  });

  test('validate for valid password', () {
    //Arrange and Act
    var result = Validator.validatePassword('password123');

    //Assert
    expect(result, null);
  });
}
