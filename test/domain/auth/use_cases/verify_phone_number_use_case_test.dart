import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/domain/auth/use_cases/verify_phone_number_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('$VerifyPhoneNumberUseCase', () {
    late MockAuthRepository mockAuthRepository;
    late VerifyPhoneNumberUseCase useCase;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      useCase = VerifyPhoneNumberUseCase(
        authRepository: mockAuthRepository,
      );
    });

    test('expect $VerificationCodeEntity', () async {
      const phoneNumber = 'phoneNumber';
      const id = 'id';
      const entity = VerificationCodeEntity.value(
        VerificationCodeValueObject(id: id),
      );

      when(() => mockAuthRepository.requestVerificationCode(phoneNumber: phoneNumber)).thenAnswer(
        (_) => Future.value(entity),
      );

      final result = await useCase.call(phoneNumber);

      expect(result, entity);
      verify(() => mockAuthRepository.requestVerificationCode(phoneNumber: phoneNumber));
    });
  });
}
