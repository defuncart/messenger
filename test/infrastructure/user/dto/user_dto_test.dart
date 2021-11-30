import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/infrastructure/user/dto/user_dto.dart';

import '../../../test_utils.dart';

void main() {
  group('$UserDto', () {
    test('ensure equality', () {
      final user1 = TestDtos.user();
      final user2 = TestDtos.user();

      expect(user1 == user2, isTrue);
      expect(user1, user2);
    });

    final userJson = {
      'id': 'id',
      'phoneNumber': 'phoneNumber',
      'displayName': 'displayName',
      'avatarUrl': 'avatarUrl',
      'createdAt': '0001-01-01T00:00:00.000',
      'updatedAt': '0001-01-01T00:00:00.000',
    };
    final user = TestDtos.user(avatarUrl: 'avatarUrl');

    test('toJson', () {
      expect(user.toJson(), userJson);
    });

    test('fromJson', () {
      expect(UserDto.fromJson(userJson), user);
    });
  });
}
