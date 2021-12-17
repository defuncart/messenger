import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/use_cases/verify_sms_code_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$VerifySMSCodeUseCase', () {
    late MockAuthRepository mockAuthRepository;
    late VerifySMSCodeUseCase useCase;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      useCase = VerifySMSCodeUseCase(
        authRepository: mockAuthRepository,
      );
    });

    test('expect $AuthEntity', () async {
      const smsCode = 'smsCode';
      const verificationId = 'verificationId';
      final entity = TestEntities.auth();

      when(() => mockAuthRepository.signin(smsCode: smsCode, verificationId: verificationId)).thenAnswer(
        (_) => Future.value(entity),
      );

      final result = await useCase.call(verificationId: verificationId, smsCode: smsCode);

      expect(result, entity);
      verify(() => mockAuthRepository.signin(smsCode: smsCode, verificationId: verificationId));
    });
  });
}
