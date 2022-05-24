import 'package:defy_integration_testing/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      final loginButton = find.byType(TextButton).first;

      await Future.delayed(const Duration(seconds: 2));

      // Enter text for the email address
      await tester.enterText(emailField, 'abcd@gmail.com');
      await Future.delayed(const Duration(seconds: 3));

      // Enter text for the password
      await tester.enterText(passwordField, '123456');
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      var firstCheckbox = find.byType(Checkbox).first;

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );

      await tester.tap(firstCheckbox);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );

      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
