import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:messenger/domain/user/user_respository.dart';
import 'package:messenger/infrastructure/user/dto/user_dto.dart';
import 'package:messenger/infrastructure/user/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    FirebaseFirestore? firebaseFirestore,
    required DateTimeGenerator dateTimeGenerator,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _dateTimeGenerator = dateTimeGenerator;

  final FirebaseFirestore _firebaseFirestore;
  final DateTimeGenerator _dateTimeGenerator;

  static const _collection = 'users';

  /// Saves a user to db
  ///
  /// If the user does not exist, it is created, otherwise existing user overwritten
  Future<void> _saveUser(UserDto user) async {
    await _firebaseFirestore.collection(_collection).doc(user.id).set(user.toJson());
    log('$UserRepositoryImpl saved user ${user.toString()}');
  }

  /// Maps [UserDto] to [UserEntity]
  UserEntity _dtoToEntity(UserDto dto) => UserEntity.value(dto.toValueObject());

  /// Maps [DocumentSnapshot] to [UserEntity]
  UserEntity _snapshotToEntity(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.exists) {
      try {
        final dto = UserDto.fromJson(snapshot.data()!);
        return _dtoToEntity(dto);
      } catch (e) {
        return UserEntity.failure(UserCouldNotBeParsedFailure());
      }
    }
    return UserEntity.failure(UserNotFoundFailure());
  }

  @override
  Future<UserEntity> createUser({
    required String id,
    required String phoneNumber,
    required String displayName,
  }) async {
    final now = _dateTimeGenerator.nowUtc;
    final user = UserDto(
      id: id,
      phoneNumber: phoneNumber,
      displayName: displayName,
      createdAt: now,
      updatedAt: now,
    );

    await _saveUser(user);

    return _dtoToEntity(user);
  }

  @override
  Future<UserEntity> getUser({required String id}) async {
    final snapshot = await _firebaseFirestore.collection(_collection).doc(id).get();
    return _snapshotToEntity(snapshot);
  }

  @override
  Future<void> deleteUser({required String id}) async {
    await _firebaseFirestore.collection(_collection).doc(id).delete();
    log('$UserRepositoryImpl delete user with $id');
  }
}
