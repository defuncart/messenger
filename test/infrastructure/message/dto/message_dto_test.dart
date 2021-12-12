import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/message/dto/message_dto.dart';

import '../../../test_utils.dart';

void main() {
  group($MessageDto, () {
    test('ensure equality', () {
      final message1 = TestDtos.message();
      final message2 = TestDtos.message();

      expect(message1 == message2, isTrue);
      expect(message1, message2);
    });

    final messageJson = {
      'id': 'id',
      'text': 'text',
      'createdAt': '0001-01-01T00:00:00.000',
      'updatedAt': null,
      'deletedAt': null,
    };
    final message = TestDtos.message();

    test('toJson', () {
      expect(message.toJson(), messageJson);
    });

    test('fromJson', () {
      expect(MessageDto.fromJson(messageJson), message);
    });
  });
}
