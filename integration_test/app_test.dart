import 'package:bookstore/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the signin button, verify navigation',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const Bookstore());

      // Verify the counter starts at 0.
      expect(find.text('Padhu Bookstore'), findsOneWidget);

      final un = find.bySemanticsLabel("Username");

      await tester.enterText(un, "Padmanaban");

      final pw = find.bySemanticsLabel("Password");

      await tester.enterText(pw, "somepassword");      

      // Finds the floating action button to tap on.
      final tb = find.widgetWithText(TextButton, 'Sign in');

      // Emulate a tap on the floating action button.
      await tester.tap(tb);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('Popular'), findsOneWidget);
    });
  });
}