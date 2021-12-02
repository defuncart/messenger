import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_ui/flutter_test_ui.dart';
import 'package:messenger/presentation/auth/widgets/sms_code_auth_panel.dart';

import '../../../test_utils.dart';

void main() {
  group('$SMSCodeAuthPanel', () {
    group('when first shown', () {
      setUpUI((tester) async {
        final widget = wrapWithMaterialAppLocalizationDelegates(
          const Scaffold(
            body: SMSCodeAuthPanel(),
          ),
        );
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
      });

      testUI('expect correct widget tree', (tester) async {
        expect(find.text('Enter Code'), findsOneWidget);
        expect(find.byType(DigitTextFields), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
        expect(find.text('No code received?'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.text('Continue'), findsOneWidget);
      });
    });
  });
}
