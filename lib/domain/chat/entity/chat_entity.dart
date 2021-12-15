import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/common/entities/entity.dart';
import 'package:messenger/common/entities/failure.dart';
import 'package:messenger/common/entities/value_object.dart';

part 'chat_entity.freezed.dart';

class ChatEntity extends Entity<ChatValueObject> {
  const ChatEntity.value(ChatValueObject value) : super.value(value);

  const ChatEntity.failure(Failure failure) : super.failure(failure);
}

@freezed
class ChatValueObject extends ValueObject with _$ChatValueObject {
  const factory ChatValueObject({
    required String id,
    @Default('') String title,
    required List<String> userIds,
    @Default([]) List<String> messages,
    required String createdBy,
    @Default(false) bool isDeleted,
  }) = _ChatValueObject;
}

class ChatNotFoundFailure extends Failure {}

class ChatCouldNotBeParsedFailure extends Failure {}
