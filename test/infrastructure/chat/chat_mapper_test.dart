import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/chat/chat.mapper.dart';

import '../../test_utils.dart';

void main() {
  group('ChatDtoExtension', () {
    group('toValueObject', () {
      final chatDto = TestDtos.chat();
      final chatValueObject = TestValueObjects.chat();
      test('Expect that value object is correctly converted', () {
        expect(chatDto.toValueObject(), chatValueObject);
      });
    });

    group('when deletedAt is not null', () {
      final chatDto = TestDtos.chat(deletedAt: DateTime(1));

      test('expect isEdited isTrue', () {
        expect(chatDto.toValueObject().isDeleted, isTrue);
      });
    });
  });
}
