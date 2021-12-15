import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/chat/dto/chat_dto.dart';

import '../../../test_utils.dart';

void main() {
  group('$ChatDto', () {
    test('ensure equality', () {
      final chat1 = TestDtos.chat();
      final chat2 = TestDtos.chat();
      expect(chat1 == chat1, isTrue);
      expect(chat1, chat2);
    });

    final chatJson = {
      'id': 'id',
      'messages': [],
      'title': '',
      'userIds': [],
      'createdBy': 'createdBy',
      'createdAt': '0001-01-01T00:00:00.000',
      'updatedAt': null,
      'deletedAt': null,
    };
    final chat = TestDtos.chat();

    test('toJson', () {
      expect(chat.toJson(), chatJson);
    });

    test('fromJson', () {
      expect(ChatDto.fromJson(chatJson), chat);
    });
  });
}
