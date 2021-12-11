import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';

part 'auth_entity.freezed.dart';

class AuthEntity extends Entity {
  const AuthEntity.value(AuthValueObject value) : super.value(value);

  const AuthEntity.failure(Failure failure) : super.failure(failure);
}

@freezed
class AuthValueObject extends ValueObject with _$AuthValueObject {
  const factory AuthValueObject({
    required bool authenticatedSuccessfully,
  }) = _AuthValueObject;
}

class AuthFailure extends Failure {}
