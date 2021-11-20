import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/user/user_mapper.dart';

import '../../test_utils.dart';

void main() {
  group('UserDtoExtensions', () {
    group('toValueObject', () {
      final dto = TestDtos.user();
      final valueObject = TestValueObjects.user();

      test('Expect that value object is correctly converted', () {
        expect(dto.toValueObject(), valueObject);
      });
    });
  });
}
