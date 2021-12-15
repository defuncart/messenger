import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/infrastructure/chat/dto/chat_dto.dart';

extension ChatDtoExtensions on ChatDto {
  ChatValueObject toValueObject() => ChatValueObject(
        id: id,
        userIds: userIds,
        messages: messages,
        title: title,
        createdBy: createdBy,
        isDeleted: deletedAt != null,
      );
}
