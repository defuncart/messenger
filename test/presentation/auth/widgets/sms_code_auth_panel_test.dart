import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_ui/flutter_test_ui.dart';
import 'package:messenger/presentation/auth/widgets/sms_code_auth_panel.dart';

import '../../../test_utils.dart';

void main() {
  group('$SMSCodeAuthPanel', () {
    const phoneNumber = 'phoneNumber';

    group('when first shown', () {
      setUpUI((tester) async {
        final widget = wrapWithMaterialAppLocalizationDelegates(
          Scaffold(
            body: SMSCodeAuthPanel(
              phoneNumber: phoneNumber,
              onCodeSubmitted: (_) {},
              onResendCode: () {},
              onChangeNumber: () {},
            ),
          ),
        );
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
      });

      testUI('expect correct widget tree', (tester) async {
        expect(find.text('Enter Code'), findsOneWidget);
        expect(find.text(phoneNumber), findsOneWidget);
        expect(find.byType(DigitTextFields), findsOneWidget);
        expect(find.byType(TextButton), findsNWidgets(2));
        expect(find.text('Resend code'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.text('Continue'), findsOneWidget);
      });
    });
  });
}
