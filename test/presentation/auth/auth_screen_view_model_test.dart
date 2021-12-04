import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('$AuthScreenViewModel', () {
    late MockVerifyPhoneNumberUseCase mockVerifyPhoneNumberUseCase;
    late MockResendSMSCodeUseCase mockResendSMSCodeUseCase;
    late MockVerifySMSCodeUseCase mockVerifySMSCodeUseCase;
    late AuthScreenViewModel viewModel;

    setUp(() {
      mockVerifyPhoneNumberUseCase = MockVerifyPhoneNumberUseCase();
      mockResendSMSCodeUseCase = MockResendSMSCodeUseCase();
      mockVerifySMSCodeUseCase = MockVerifySMSCodeUseCase();
      viewModel = AuthScreenViewModel(
        verifyPhoneNumberUseCase: mockVerifyPhoneNumberUseCase,
        resendSMSCodeUseCase: mockResendSMSCodeUseCase,
        verifySMSCodeUseCase: mockVerifySMSCodeUseCase,
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
          verify(() => mockVerifyPhoneNumberUseCase.call('+4915289763484'));
        });
      });

      group('when number is invalid', () {
        setUp(() {
          when(() => mockVerifyPhoneNumberUseCase.call(any())).thenAnswer((_) => Future.value(false));
        });

        test('then expect state is ${AuthScreenState.phoneNumber}', () async {
          await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
          expect(viewModel.state, AuthScreenState.phoneNumber);
          verify(() => mockVerifyPhoneNumberUseCase.call('+4915289763484'));
        });
      });

      group('onCodeSubmitted', () {
        const smsCode = 'smsCode';

        group('when code is valid', () {
          setUp(() {
            when(() => mockVerifySMSCodeUseCase.call(smsCode)).thenAnswer((_) => Future.value(true));
          });

          test('then expect true returned', () async {
            expect(await viewModel.onCodeSubmitted('smsCode'), isTrue);
            verify(() => mockVerifySMSCodeUseCase.call(smsCode));
          });
        });

        group('when code is invalid', () {
          setUp(() {
            when(() => mockVerifySMSCodeUseCase.call(smsCode)).thenAnswer((_) => Future.value(false));
          });

          test('then expect false returned', () async {
            expect(await viewModel.onCodeSubmitted('smsCode'), isFalse);
            verify(() => mockVerifySMSCodeUseCase.call(smsCode));
          });
        });
      });

      group('onResendCode', () {
        group('when code is resent', () {
          setUp(() {
            when(() => mockResendSMSCodeUseCase.call()).thenAnswer((_) => Future.value(true));
          });

          test('then expect true returned', () async {
            expect(await viewModel.onResendCode(), isTrue);
            verify(() => mockResendSMSCodeUseCase.call());
          });
        });

        group('when code is not resent', () {
          setUp(() {
            when(() => mockResendSMSCodeUseCase.call()).thenAnswer((_) => Future.value(false));
          });

          test('then expect true returned', () async {
            expect(await viewModel.onResendCode(), isFalse);
            verify(() => mockResendSMSCodeUseCase.call());
          });
        });
      });

      group('onChangeNumber', () {
        test('expect state is ${AuthScreenState.phoneNumber}', () {
          viewModel.onChangeNumber();
          expect(viewModel.state, AuthScreenState.phoneNumber);
        });
      });
    });
  });
}
