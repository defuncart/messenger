import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/entities/failures.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$AuthScreenViewModel', () {
    late MockVerifyPhoneNumberUseCase mockVerifyPhoneNumberUseCase;
    late MockResendSMSCodeUseCase mockResendSMSCodeUseCase;
    late MockVerifySMSCodeUseCase mockVerifySMSCodeUseCase;
    late MockCreateUserOnFirstLoginUseCase mockCreateUserOnFirstLoginUseCase;
    late AuthScreenViewModel viewModel;

    setUp(() {
      mockVerifyPhoneNumberUseCase = MockVerifyPhoneNumberUseCase();
      mockResendSMSCodeUseCase = MockResendSMSCodeUseCase();
      mockVerifySMSCodeUseCase = MockVerifySMSCodeUseCase();
      mockCreateUserOnFirstLoginUseCase = MockCreateUserOnFirstLoginUseCase();
      viewModel = AuthScreenViewModel(
        verifyPhoneNumberUseCase: mockVerifyPhoneNumberUseCase,
        resendSMSCodeUseCase: mockResendSMSCodeUseCase,
        verifySMSCodeUseCase: mockVerifySMSCodeUseCase,
        createUserOnFirstLoginUseCase: mockCreateUserOnFirstLoginUseCase,
      );
    });

    group('onPhoneNumberSubmitted', () {
      test('initial state is ${AuthScreenState.phoneNumber}', () {
        expect(viewModel.state, AuthScreenState.phoneNumber);
      });

      group('when number is valid', () {
        setUp(() {
          when(() => mockVerifyPhoneNumberUseCase.call(any()))
              .thenAnswer((_) => Future.value(TestEntities.verificationCode()));
        });

        test('then expect state is ${AuthScreenState.smsCode}', () async {
          await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
          expect(viewModel.state, AuthScreenState.smsCode);
          verify(() => mockVerifyPhoneNumberUseCase.call('+4915289763484'));
        });
      });

      group('when number is invalid', () {
        setUp(() {
          when(() => mockVerifyPhoneNumberUseCase.call(any()))
              .thenAnswer((_) => Future.value(VerificationCodeEntity.failure(VerificationCodeFailure())));
        });

        test('then expect state is ${AuthScreenState.phoneNumber}', () async {
          await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
          expect(viewModel.state, AuthScreenState.phoneNumber);
          verify(() => mockVerifyPhoneNumberUseCase.call('+4915289763484'));
        });
      });
    });

    group('onCodeSubmitted', () {
      const smsCode = 'smsCode';
      const verificationId = '';

      group('when code is valid', () {
        setUp(() {
          when(() => mockVerifySMSCodeUseCase.call(verificationId: verificationId, smsCode: smsCode))
              .thenAnswer((_) => Future.value(TestEntities.auth()));
        });

        test('then expect true returned', () async {
          expect(await viewModel.onCodeSubmitted('smsCode'), isTrue);
          verify(() => mockVerifySMSCodeUseCase.call(verificationId: verificationId, smsCode: smsCode));
        });
      }, skip: true);

      group('when code is invalid', () {
        setUp(() {
          when(() => mockVerifySMSCodeUseCase.call(verificationId: verificationId, smsCode: smsCode))
              .thenAnswer((_) => Future.value(AuthEntity.failure(AuthFailure())));
        });

        test('then expect false returned', () async {
          expect(await viewModel.onCodeSubmitted('smsCode'), isFalse);
          verify(() => mockVerifySMSCodeUseCase.call(verificationId: verificationId, smsCode: smsCode));
        });
      });
    });

    group('onResendCode', () {
      const phoneNumber = '+4915289763484';
      const resendToken = 0;

      setUp(() async {
        when(() => mockVerifyPhoneNumberUseCase.call(any()))
            .thenAnswer((_) => Future.value(TestEntities.verificationCode()));
        await viewModel.onPhoneNumberSubmitted('+49', '15289763484');
      });

      group('when code is resent', () {
        setUp(() {
          when(() => mockResendSMSCodeUseCase.call(phoneNumber: phoneNumber, resendToken: resendToken))
              .thenAnswer((_) => Future.value(TestEntities.verificationCode()));
        });

        test('then expect true returned', () async {
          expect(await viewModel.onResendCode(), isTrue);
          verify(() => mockResendSMSCodeUseCase.call(phoneNumber: phoneNumber, resendToken: resendToken));
        });
      });

      group('when code is not resent', () {
        setUp(() {
          when(() => mockResendSMSCodeUseCase.call(phoneNumber: phoneNumber, resendToken: resendToken))
              .thenAnswer((_) => Future.value(VerificationCodeEntity.failure(NoInternetFailure())));
        });

        test('then expect true returned', () async {
          expect(await viewModel.onResendCode(), isFalse);
          verify(() => mockResendSMSCodeUseCase.call(phoneNumber: phoneNumber, resendToken: resendToken));
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
}
