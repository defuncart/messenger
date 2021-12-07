import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    group('$DigitTextFields', () {
      const count = 6;

      setUpUI((tester) async {
        final widget = wrapWithMaterialAppLocalizationDelegates(
          Scaffold(
            body: DigitTextFields(
              count: count,
              onChanged: (_, __) {},
            ),
          ),
        );
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
      });

      testUI('expect correct widget tree', (tester) async {
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(DigitTextField), findsNWidgets(count));
      });

      testUI('expect first digit is focused and others unfocused', (tester) async {
        for (var i = 0; i < count; i++) {
          final digitalTextField = tester.widget<DigitTextField>(find.byKey(Key('DigitTextField$i')));
          expect(
            digitalTextField.focusNode.hasFocus,
            i == 0 ? isTrue : isFalse,
          );
        }
      });

      group('when a digit is entered', () {
        setUpUI((tester) async {
          await tester.enterText(find.byKey(const Key('DigitTextField0')), '1');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
        });

        testUI('expect text is displayed', (tester) async {
          final digitalTextField = tester.widget<DigitTextField>(find.byKey(const Key('DigitTextField0')));
          expect(digitalTextField.controller.text, '1');
          expect(find.text('1'), findsOneWidget);
        });

        testUI('expect second digit is focused and others unfocused', (tester) async {
          for (var i = 0; i < count; i++) {
            final digitalTextField = tester.widget<DigitTextField>(find.byKey(Key('DigitTextField$i')));
            expect(
              digitalTextField.focusNode.hasFocus,
              i == 1 ? isTrue : isFalse,
            );
          }
        }, skip: true);

        group('when a backspace is entered', () {
          setUpUI((tester) async {
            await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
            await tester.pumpAndSettle();
          });

          testUI('expect text is displayed', (tester) async {
            final digitalTextField = tester.widget<DigitTextField>(find.byKey(const Key('DigitTextField0')));
            expect(digitalTextField.controller.text, '1');
            expect(find.text('1'), findsOneWidget);
          });

          testUI('expect first digit is focused and others unfocused', (tester) async {
            for (var i = 0; i < count; i++) {
              final digitalTextField = tester.widget<DigitTextField>(find.byKey(Key('DigitTextField$i')));
              expect(
                digitalTextField.focusNode.hasFocus,
                i == 0 ? isTrue : isFalse,
              );
            }
          }, skip: true);
        });
      });
    });
  });
}
