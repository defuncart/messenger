import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('$AuthScreenViewModel', () {
    late MockVerifyPhoneNumberUseCase mockVerifyPhoneNumberUseCase;
    late AuthScreenViewModel viewModel;

    setUp(() {
      mockVerifyPhoneNumberUseCase = MockVerifyPhoneNumberUseCase();
      viewModel = AuthScreenViewModel(
        verifyPhoneNumberUseCase: mockVerifyPhoneNumberUseCase,
      );
    });

    group('onPhoneNumberSubmitted', () {
      test('initial state is ${AuthScreenState.phoneNumber}', () {
        expect(viewModel.state, AuthScreenState.phoneNumber);
      });

      group('when number is valid', () {
        setUp(() {
          when(() => mockVerifyPhoneNumberUseCase.call(any())).thenAnswer((_) => Future.value(true));
        });

        test('then expect state is ${AuthScreenState.smsCode}', () async {
          await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
          expect(viewModel.state, AuthScreenState.smsCode);
        });
      });

      group('when number is invalid', () {
        setUp(() {
          when(() => mockVerifyPhoneNumberUseCase.call(any())).thenAnswer((_) => Future.value(false));
        });

        test('then expect state is ${AuthScreenState.phoneNumber}', () async {
          await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
          expect(viewModel.state, AuthScreenState.phoneNumber);
        });
      });
    });
  });
}
