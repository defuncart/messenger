import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/common/use_cases/create_user_on_first_login_use_case.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$CreateUserOnFirstLoginUseCase', () {
    late MockUserRepository mockUserRepository;
    late CreateUserOnFirstLoginUseCase useCase;

    setUp(() {
      mockUserRepository = MockUserRepository();
      useCase = CreateUserOnFirstLoginUseCase(
        userRepository: mockUserRepository,
      );
    });

    const id = 'id';
    const phoneNumber = 'phoneNumber';
    const displayName = 'displayName';

    group('when user already exists', () {
      setUp(() {
        when(() => mockUserRepository.getUser(id: id)).thenAnswer((_) => Future.value(TestEntities.user(id: id)));
      });

      test('expect no new user is created', () {
        useCase.call(userId: id, phoneNumber: phoneNumber, displayName: displayName);

        verify(() => mockUserRepository.getUser(id: id));
        verifyNever(() => mockUserRepository.createUser(id: id, phoneNumber: phoneNumber, displayName: displayName));
      });
    });

    group('when user does not exist', () {
      setUp(() {
        when(() => mockUserRepository.getUser(id: id))
            .thenAnswer((_) => Future.value(UserEntity.failure(UserNotFoundFailure())));
        when(() => mockUserRepository.createUser(id: id, phoneNumber: phoneNumber, displayName: displayName))
            .thenAnswer((_) => Future.value(TestEntities.user()));
      });

      test('expect new user is created', () async {
        await useCase.call(userId: id, phoneNumber: phoneNumber, displayName: displayName);

        verify(() => mockUserRepository.getUser(id: id));
        verify(() => mockUserRepository.createUser(id: id, phoneNumber: phoneNumber, displayName: displayName));
      });
    });
  });
}
