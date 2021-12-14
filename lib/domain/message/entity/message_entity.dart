import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';

part 'message_entity.freezed.dart';

class MessageEntity extends Entity<MessageValueObject> {
  const MessageEntity.value(MessageValueObject value) : super.value(value);

  const MessageEntity.failure(Failure failure) : super.failure(failure);
}

@freezed
class MessageValueObject extends ValueObject with _$MessageValueObject {
  const factory MessageValueObject({
    required String id,
    required String text,
    required String createdBy,
    required DateTime createdAt,
    @Default(false) bool isEdited,
    @Default(false) bool isDeleted,
  }) = _MessageValueObject;
}

class MessageNotFoundFailure extends Failure {}

class MessageCouldNotBeParsedFailure extends Failure {}
