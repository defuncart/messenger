import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/message/message_mapper.dart';

import '../../test_utils.dart';

void main() {
  group('MessageDtoExtensions', () {
    group('toValueObject', () {
      final dto = TestDtos.message();
      final valueObject = TestValueObjects.message();

      test('Expect that value object is correctly converted', () {
        expect(dto.toValueObject(), valueObject);
      });
    });

    group('when updatedAt is not null', () {
      final dto = TestDtos.message(updatedAt: DateTime(1));

      test('expect isEdited isTrue', () {
        expect(dto.toValueObject().isEdited, isTrue);
      });
    });

    group('when deletedAt is not null', () {
      final dto = TestDtos.message(deletedAt: DateTime(1));

      test('expect isDeleted isTrue', () {
        expect(dto.toValueObject().isDeleted, isTrue);
      });
    });
  });
}
