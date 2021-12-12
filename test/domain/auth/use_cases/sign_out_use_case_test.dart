import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/use_cases/sign_out_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('$SignOutUseCase', () {
    late MockAuthRepository mockAuthRepository;
    late SignOutUseCase useCase;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      useCase = SignOutUseCase(
        authRepository: mockAuthRepository,
      );
      when(() => mockAuthRepository.signout()).thenAnswer((_) async {});
    });

    test('expect signout is called', () async {
      await useCase.call();

      verify(() => mockAuthRepository.signout());
    });
  });
}
