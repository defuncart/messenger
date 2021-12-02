// import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_ui/flutter_test_ui.dart';
import 'package:messenger/presentation/auth/widgets/phone_number_auth_panel.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$PhoneNumberAuthPanel', () {
    late OnPhoneNumberSubmitted mockOnPhoneNumberSubmitted;

    setUp(() {
      mockOnPhoneNumberSubmitted = MockVoidCallback<String, String>();
    });

    group('when first shown', () {
      setUpUI((tester) async {
        final widget = wrapWithMaterialApp(
          Scaffold(
            body: PhoneNumberAuthPanel(
              onPhoneNumberSubmitted: mockOnPhoneNumberSubmitted,
            ),
          ),
        );
        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
      });

      testUI('expect correct widget tree', (tester) async {
        expect(find.byIcon(Icons.messenger_outline_rounded), findsOneWidget);
        expect(find.text('Messenger'), findsOneWidget);
        expect(find.text('Welcome'), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.text(PhoneNumberAuthPanel.countryCode), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.text('Continue'), findsOneWidget);
      });

      testUI('then input hint is displayed', (tester) async {
        expect(
          find.text('Phone Number'),
          findsOneWidget,
        );
      });

      testUI('then continue button is inactive', (tester) async {
        final button = tester.widget(find.byType(ElevatedButton)) as ElevatedButton;
        expect(button.enabled, isFalse);
      });

      group('when letters are typed', () {
        setUpUI((tester) async {
          await tester.enterText(find.byType(TextField), 'bla');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
        });

        testUI('then text field is not updated', (tester) async {
          final textField = tester.widget(find.byType(TextField)) as TextField;
          final button = tester.widget(find.byType(ElevatedButton)) as ElevatedButton;
          expect(textField.controller!.text, isEmpty);
          expect(button.enabled, isFalse);
        });
      });

      group('when numbers are typed', () {
        const input = '123';

        setUpUI((tester) async {
          await tester.enterText(find.byType(TextField), input);
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
        });

        testUI('then text field is updated and button is enabled', (tester) async {
          final textField = tester.widget(find.byType(TextField)) as TextField;
          final button = tester.widget(find.byType(ElevatedButton)) as ElevatedButton;
          expect(textField.controller!.text, input);
          expect(button.enabled, isTrue);
        });

        group('when button is pressed', () {
          setUpUI((tester) async {
            await tester.tap(find.byType(ElevatedButton));
          });

          testUI('expect callback is invoked', (tester) async {
            verify(() => mockOnPhoneNumberSubmitted.call(PhoneNumberAuthPanel.countryCode, input));
          });

          testUI('expect input field does not have focus', (tester) async {
            final textField = tester.widget(find.byType(TextField)) as TextField;
            expect(textField.focusNode!.hasFocus, isFalse);
          });
        });
      });
    });
  });
}
