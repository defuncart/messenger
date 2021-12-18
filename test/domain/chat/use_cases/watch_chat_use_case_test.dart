import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/chat/use_cases/watch_chat_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$WatchChatUseCase', () {
    late MockChatRepository mockChatRepository;
    late WatchChatUseCase useCase;

    setUp(() {
      mockChatRepository = MockChatRepository();
      useCase = WatchChatUseCase(
        chatRepository: mockChatRepository,
      );
    });

    const id = 'id';
    final entity = TestEntities.chat();

    test('ensure use case calls chat repository', () async {
      when(() => mockChatRepository.watchChat(id: id)).thenAnswer((_) => Stream.value(entity));

      final stream = useCase(id);

      expect(await stream.first, entity);
      verify(() => mockChatRepository.watchChat(id: id));
    });
  });
}
