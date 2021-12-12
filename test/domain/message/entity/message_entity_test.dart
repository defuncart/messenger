import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';

import '../../../test_utils.dart';

void main() {
  group('$MessageEntity', () {
    test('ensure equality', () {
      final message1 = TestEntities.message();
      final message2 = TestEntities.message();

      expect(message1 == message2, isTrue);
      expect(message1, message2);
    });
  });

  group('$MessageValueObject', () {
    test('ensure equality', () {
      final message1 = TestValueObjects.message();
      final message2 = TestValueObjects.message();

      expect(message1 == message2, isTrue);
      expect(message1, message2);
    });
  });
}
