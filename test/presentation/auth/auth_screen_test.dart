import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_ui/flutter_test_ui.dart';
import 'package:messenger/presentation/auth/auth_screen.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:messenger/presentation/auth/widgets/phone_number_auth_panel.dart';
import 'package:messenger/presentation/auth/widgets/sms_code_auth_panel.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$AuthScreenContent', () {
    late MockAuthScreenViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockAuthScreenViewModel();

      when(() => mockViewModel.isLoading).thenReturn(false);
      when(() => mockViewModel.phoneNumberIsInvalid).thenReturn(false);
    });

    setUpUI((tester) async {
      final widget = wrapWithMaterialAppLocalizationDelegates(
        AuthScreenContent(
          viewModel: mockViewModel,
        ),
      );

      await tester.pumpWidget(widget);
    });

    group('when viewMode state is ${AuthScreenState.phoneNumber}', () {
      setUp(() {
        when(() => mockViewModel.state).thenReturn(AuthScreenState.phoneNumber);
      });

      testUI('then expect $PhoneNumberAuthPanel', (tester) async {
        expect(find.byType(PhoneNumberAuthPanel), findsOneWidget);
        expect(find.byType(SMSCodeAuthPanel), findsNothing);
      });
    });

    group('when viewMode state is ${AuthScreenState.smsCode}', () {
      setUp(() {
        when(() => mockViewModel.state).thenReturn(AuthScreenState.smsCode);
      });

      testUI('then expect $SMSCodeAuthPanel', (tester) async {
        expect(find.byType(PhoneNumberAuthPanel), findsNothing);
        expect(find.byType(SMSCodeAuthPanel), findsOneWidget);
      });
    });
  });
}
