import 'package:messenger/domain/user/entity/user_entity.dart';

abstract class UserRepository {
  /// Creates a [UserEntity] with [id], [phoneNumber] and [displayName]
  Future<UserEntity> createUser({
    required String id,
    required String phoneNumber,
    required String displayName,
  });

  /// Returns a [UserEntity] by [id]
  Future<UserEntity> getUser({required String id});

  /// Deletes a [UserEntity] by [id]
  Future<void> deleteUser({required String id});
}
