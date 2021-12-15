import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';

import '../../../test_utils.dart';

void main() {
  group('$ChatEntity', () {
    test('ensure equality', () {
      final chat1 = TestEntities.chat();
      final chat2 = TestEntities.chat();

      expect(chat1 == chat2, isTrue);
      expect(chat1, chat2);
    });
  });

  group('$ChatValueObject', () {
    test('ensure equality', () {
      final chat1 = TestValueObjects.chat();
      final chat2 = TestValueObjects.chat();

      expect(chat1 == chat2, isTrue);
      expect(chat1, chat2);
    });
  });
}
