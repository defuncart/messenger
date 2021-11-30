import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';

part 'user_entity.freezed.dart';

class UserEntity extends Entity {
  const UserEntity.value(UserValueObject value) : super.value(value);

  const UserEntity.failure(Failure failure) : super.failure(failure);
}

@freezed
class UserValueObject extends ValueObject with _$UserValueObject {
  const factory UserValueObject({
    required String id,
    required String phoneNumber,
    required String displayName,
    String? avatarUrl,
  }) = _UserValueObject;
}

class UserNotFoundFailure extends Failure {}

class UserCouldNotBeParsedFailure extends Failure {}
