import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/failures/user_is_not_authenticated_failure.dart';
import 'package:messenger/domain/message/message_repository.dart';
import 'package:messenger/domain/message/use_cases/send_message_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$SendMessageUseCase', () {
    late MockMessageRepository mockMessageRepository;
    late MockAuthRepository mockAuthRepository;
    late SendMessageUseCase useCase;

    setUp(() {
      mockMessageRepository = MockMessageRepository();
      mockAuthRepository = MockAuthRepository();
      useCase = SendMessageUseCase(
        messageRepository: mockMessageRepository,
        authRepository: mockAuthRepository,
      );
    });

    const text = 'text';
    const createdBy = 'createdBy';

    group('when user is authenticated', () {
      setUp(() {
        when(() => mockAuthRepository.userId).thenReturn(createdBy);
      });

      test('ensure $MessageRepository createMessage is called', () async {
        when(() => mockMessageRepository.createMessage(text: text, createdBy: createdBy))
            .thenAnswer((_) => Future.value(TestEntities.message()));

        final entity = await useCase(text);
        expect(entity.hasValue, isTrue);
        verify(() => mockMessageRepository.createMessage(text: text, createdBy: createdBy));
      });
    });

    group('when user is not authenticated', () {
      setUp(() {
        when(() => mockAuthRepository.userId).thenReturn(null);
      });

      test('ensure $MessageRepository createMessage is not called', () async {
        final entity = await useCase(text);
        expect(entity.hasValue, isFalse);
        expect(entity.failure, isA<UserIsNotAuthenticatedFailure>());
        verifyNever(() => mockMessageRepository.createMessage(text: text, createdBy: createdBy));
      });
    });
  });
}
