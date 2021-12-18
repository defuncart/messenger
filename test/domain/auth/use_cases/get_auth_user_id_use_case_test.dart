import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/use_cases/get_auth_user_id_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('$GetAuthUserIdUseCase', () {
    late MockAuthRepository mockAuthRepository;
    late GetAuthUserIdUseCase useCase;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      useCase = GetAuthUserIdUseCase(
        authRepository: mockAuthRepository,
      );
    });

    test('Ensure use case returns auth user id', () {
      const userId = 'userId';
      when(() => mockAuthRepository.userId).thenReturn(userId);

      expect(useCase(), userId);
    });
  });
}
