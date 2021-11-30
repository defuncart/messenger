import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';

part 'verification_code_entity.freezed.dart';

class VerificationCodeEntity extends Entity {
  const VerificationCodeEntity.value(VerificationCodeValueObject value) : super.value(value);

  const VerificationCodeEntity.failure(Failure failure) : super.failure(failure);
}

@freezed
class VerificationCodeValueObject extends ValueObject with _$VerificationCodeValueObject {
  const factory VerificationCodeValueObject({
    required String id,
  }) = _VerificationCodeValueObject;
}

class VerificationCodeFailure extends Failure {}
