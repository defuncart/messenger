import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/message/use_cases/watch_messages_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('$WatchMessagesUseCase', () {
    late MockMessageRepository mockMessageRepository;
    late WatchMessagesUseCase useCase;

    setUp(() {
      mockMessageRepository = MockMessageRepository();
      useCase = WatchMessagesUseCase(
        messageRepository: mockMessageRepository,
      );
    });

    const ids = ['id1', 'id2'];
    final entities = [
      TestEntities.message(id: ids.first),
      TestEntities.message(id: ids.last),
    ];

    test('ensure use case calls message repository', () async {
      when(() => mockMessageRepository.watchMessages(ids: ids)).thenAnswer((_) => Stream.value(entities));

      final stream = useCase(ids);

      expect(await stream.first, entities);
      verify(() => mockMessageRepository.watchMessages(ids: ids));
    });
  });
}
