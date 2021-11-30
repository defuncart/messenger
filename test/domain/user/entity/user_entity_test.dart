import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';

import '../../../test_utils.dart';

void main() {
  group('$UserEntity', () {
    test('ensure equality', () {
      final user1 = TestEntities.user();
      final user2 = TestEntities.user();

      expect(user1 == user2, isTrue);
      expect(user1, user2);
    });
  });

  group('$UserValueObject', () {
    test('ensure equality', () {
      final user1 = TestValueObjects.user();
      final user2 = TestValueObjects.user();

      expect(user1 == user2, isTrue);
      expect(user1, user2);
    });
  });
}
