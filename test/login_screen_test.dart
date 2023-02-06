import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/login_screen.dart';

void main() {
  testWidgets('Should have a title', (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // ACT - Call the specific widget we are testing
    Finder title = find.text("Login");

    //ASSERT
    expect(title, findsOneWidget);
  });

  testWidgets('Should have one text field form to collect user email id',
      (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // ACT - Call the specific widget we are testing
    Finder usernameTextfield = find.byKey(const ValueKey("email_id"));

    //ASSERT
    expect(usernameTextfield, findsOneWidget);
  });

  testWidgets('Should have one text field form to collect user password',
      (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // ACT - Call the specific widget we are testing
    Finder passwordTextfield = find.byKey(const ValueKey("password"));

    //ASSERT
    expect(passwordTextfield, findsOneWidget);
  });

  testWidgets('Should have one login button', (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // ACT - Call the specific widget we are testing
    Finder loginButton = find.byType(ElevatedButton);

    //ASSERT
    expect(loginButton, findsOneWidget);
  });

  testWidgets(
      "Should show Required Fields error id user email & password is empty ",
      (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // ACT - Simulate tap event
    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester
        .pumpAndSettle(); //This waits for the animation and changes to happen first before continuing
    Finder errorTexts = find.text("Required Field");

    //ASSERT
    expect(errorTexts, findsNWidgets(2));
  });

  testWidgets("Should submit form when user email id & password is valid",
      (WidgetTester tester) async {
    // ARRANGE - Load a widget inside the test file
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    //ACT
    Finder usernameTextfield = find.byKey(const ValueKey("email_id"));
    Finder passwordTextfield = find.byKey(const ValueKey("password"));
    Finder loginButton = find.byType(ElevatedButton);

    await tester.enterText(usernameTextfield, 'apjavier27@gmail.com');
    await tester.enterText(passwordTextfield, 'password123!');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder errorTexts = find.text("Required Field");
    Finder errorTexts2 = find.text("Please enter a valid email id");
    Finder errorTexts3 =
        find.text("Please enter atleast 8 characters for password");

    //ASSERT
    expect(errorTexts, findsNothing);
    expect(errorTexts2, findsNothing);
    expect(errorTexts3, findsNothing);
  });
}
