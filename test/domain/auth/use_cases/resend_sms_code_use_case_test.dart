import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/domain/auth/use_cases/resend_sms_code_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$ResendSMSCodeUseCase', () {
    late MockAuthRepository mockAuthRepository;
    late ResendSMSCodeUseCase useCase;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      useCase = ResendSMSCodeUseCase(
        authRepository: mockAuthRepository,
      );
    });

    test('expect $VerificationCodeEntity', () async {
      const phoneNumber = 'phoneNumber';
      const resendToken = 0;
      final entity = TestEntities.verificationCode();

      when(() => mockAuthRepository.resendVerificationCode(phoneNumber: phoneNumber, resendToken: resendToken))
          .thenAnswer(
        (_) => Future.value(entity),
      );

      final result = await useCase.call(phoneNumber: phoneNumber, resendToken: resendToken);

      expect(result, entity);
      verify(() => mockAuthRepository.resendVerificationCode(phoneNumber: phoneNumber, resendToken: resendToken));
    });
  });
}
