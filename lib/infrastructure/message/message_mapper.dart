import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/infrastructure/message/dto/message_dto.dart';

extension MessageDtoExtensions on MessageDto {
  MessageValueObject toValueObject() => MessageValueObject(
        id: id,
        text: text,
        createdAt: createdAt,
        isEdited: updatedAt != null,
        isDeleted: deletedAt != null,
      );
}
