import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("Login Flow", () {
    //Ensures that whatever resides in this group will be taken as integration testing
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets(
        "Should show Required Fields error message when user taps on login button without entering email & password",
        (WidgetTester tester) async {
      // ARRANGE - Load a widget inside the test file
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      //ACT
      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      //Wait for 2 seconds before continuing, so that we can see the flow (duration is optional)
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder errorTexts = find.text("Required Field");

      //ASSERT
      expect(errorTexts, findsNWidgets(2));
    });

    testWidgets(
        "Should show home screen when user taps on login button after entering valid email & password",
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

      Finder welcomeText = find.byType(Text);

      //ASSERT
      expect(welcomeText, findsOneWidget);
    });
  });
}
